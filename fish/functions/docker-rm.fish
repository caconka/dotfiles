function docker-rm
	docker rm (docker ps -a -q)
end

