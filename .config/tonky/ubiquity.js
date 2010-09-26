CmdUtils.CreateCommand({
  name: "mininova-search",
  icon: "http://s.mininova.org/images/icon-toolbar.png",
  takes: {"Torrent tracker": noun_arb_text},
  preview: function( pblock, theShout ) {
    pblock.innerHTML = "Search for: " + theShout.text;
  },
  execute: function( theShout ) {
    Utils.openUrlInBrowser("http://www.mininova.org/search/" + theShout.text + "/seeds");
  }
})

CmdUtils.CreateCommand({
  name: "pirate-bay-search",
  // icon: "http://s.mininova.org/images/icon-toolbar.png",
  takes: {"Torrent tracker": noun_arb_text},
  preview: function( pblock, theShout ) {
    pblock.innerHTML = "Search for: " + theShout.text;
  },
  execute: function( theShout ) {
    Utils.openUrlInBrowser("http://thepiratebay.org/search/" + theShout.text + "/0/7/0");
  }
})
