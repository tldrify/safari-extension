function handleMessage(msgEvent) {
	var messageName = msgEvent.name;
	if (messageName === "tldrify") {
		(function(d){d.body.appendChild(d.createElement('script')).src='//tldrify.com/static/js/bookmarklet.min.js?_'+new Date().getTime();})(document);
	}
}

safari.self.addEventListener("message", handleMessage, false);

