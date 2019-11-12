function docker-stop
	docker stop (docker ps -a -q)
end

