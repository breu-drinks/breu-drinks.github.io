// Base
$(document).ready(function() {
  if($("#instafeed" + name).length > 0) {
    var feed = new Instafeed({
      get: 'user',
      userId: 11689083,
      accessToken: "11689083.de588af.78a3273e2fbf46108cd6de1c53d39aef",
      limit: 4,
      resolution: 'standard_resolution',
      template: '<div class="col-sm-3"><a target="_blank" href="{{link}}" class="thumbnail"><img src="{{image}}" alt="{{caption}}"/></div></div>'
    });
    feed.run();
  }
});
