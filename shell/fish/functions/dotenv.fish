function dotenv
	if [ -e .env ]
		export (cat .env | xargs -L 1)
	end
end
