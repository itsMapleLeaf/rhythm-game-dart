# PUB_COMMAND=pub
PUB_COMMAND=pub.bat

default:
	$(PUB_COMMAND) serve &
	browser-sync start --proxy "localhost:8080" --files "web/**"