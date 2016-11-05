default: pub-serve browser-sync

pub-serve:
	pub serve

browser-sync:
	browser-sync start --proxy localhost:8080 --files web/**