function docker-list
	docker ps -aq | while read line
		docker $argv $line
	end
end
