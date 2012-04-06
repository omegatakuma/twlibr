(define-module libr.twitter
			   (use rfc.http)
			   (use sxml.ssax)
			   (use sxml.sxpath)
			   (export ))
(select-module libr.twitter)
(define uri "api.twitter.com")
;StatusGET
(define (status-get user cmd)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/users/show.xml?screen_name="user))
						(ssax:xml->sxml (open-input-string body) '()))
		((sxpath (string-append "/user/"cmd"_count/text")) result)))
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
								  (string-append "/1/favorites/"user".xml?pages="n))
						(ssax:xml->sxml (open-input-string body) '()))
		(map (lambda(x)x) ((sxpath "/statuses/status/text/text()") result))))

;FollowGET
(define (follow-user-get user)
  (let1 result (receive (status head body)
						(http-get uri (string-append "/1/friend/ids/"user".xml"))
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
(provide "libr/twitter")
