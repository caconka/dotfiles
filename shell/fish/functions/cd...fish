function cd..
	if set -q argv[1]
		cd (string repeat -n $argv[1] "../")
	else
		cd ..
	end
end
