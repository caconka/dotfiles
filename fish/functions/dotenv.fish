function dotenv
	if [ -e .env ]                                                                                                                                                                          11:00:06
		while read LINE
			set lineSplit (string split "=" -- $LINE)
			set -x $lineSplit
		end < .env
	end
end
