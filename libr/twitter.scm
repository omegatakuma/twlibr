(define-module libr.twitter
			   (use rfc.http)
			   (use sxml.ssax)
			   (use sxml.sxpath)
			   (export status-get user-get tweet-get fav-get follow-user-get follower-user-get follow-id-get follower-id-get))
(select-module libr.twitter)
(define uri "api.twitter.com")
;StatusGET
(define (status-get user cmd)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/users/show.xml?screen_name="user))
						(ssax:xml->sxml (open-input-string body) '()))
		(cond 
		  ((equal? cmd "tweet")((sxpath "/user/statuses_count/text()") result))
		  ((equal? cmd "bio")((sxpath "/user/description/text()") result))		  
		  ((equal? cmd "follow")((sxpath "/user/friends_count/text()") result))
		  ((equal? cmd "follower")((sxpath "/user/followers_count/text()") result))
		  ((equal? cmd "fav")((sxpath "/user/favourites_count/text()") result))
		  ((equal? cmd "url")((sxpath "/user/url/text()") result))
		  ((equal? cmd "timezone")((sxpath "/user/time_zone/text()") result))
		  ((equal? cmd "bio")((sxpath "/user/description/text()") result))
		  ((equal? cmd "time")((sxpath "/user/created_at/text()") result))
		  (else (error "not found command: " cmd)))))
;IDGET
(define (user-get id)
  (let1 result (receive (status head body)
						(http-get uri
								  (string-append "/1/users/show.xml?id=" id))
						(ssax:xml->sxml (open-input-string body) '()))
		((sxpath "/user/screen_name/text()") result)))
;TweetGET
(define (tweet-get user n)
  (let1 result (receive (status head body)
						(http-get uri
								  (string-append "/1/statuses/user_timeline/"user".xml?count="n))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)x) ((sxpath "/statuses/status/text/text()") result))))
;FavGET
(define (fav-get user n)
  (let1 result (receive (status head body)
						(http-get uri
								  (string-append "/1/favorites/"user".xml?page="n))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)x) ((sxpath "/statuses/status/text/text()") result))))

;FollowGET
(define (follow-user-get user)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/friends/ids/"user".xml"))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)(user-get x)) (map (lambda(x)(cadr x)) ((sxpath "/id_list/ids/id") result)))))
;FollowerGET
(define (follower-get user)
  (let1 result 
		(receive (head head body)
				 (http-get uri
						   (string-append "/1/followers/ids/" user ".xml"))
				 (ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)(user-get x)) (map (lambda(x)(cadr x)) ((sxpath "/id_list/ids/id") result)))))
;Follow-ID-GET
(define (follow-id-get user)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/friends/ids/"user".xml"))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)(cadr x)) ((sxpath "/id_list/ids/id") result))))
;Follower-ID-GET
(define (follower-id-get user)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/followers/ids/"user".xml"))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)(cadr x)) ((sxpath "/id_list/ids/id") result))))
(provide "libr/twitter")
