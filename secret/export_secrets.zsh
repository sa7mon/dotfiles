SECRET_PATH=~/.secret
if [ -d "$SECRET_PATH" ]
then
	source $SECRET_PATH/*
fi
