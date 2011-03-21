var jQT = new $.jQTouch({
    icon: 'jqtouch.png',
    addGlossToIcon: false,
    startupScreen: 'jqt_startup.png',
    statusBar: 'black'
});

$(function(){
    function setDisplay(text) {
        $('div#jqt .info').empty().append(text)
    }
    
    // We pass "updateLocation" a callback function,
    // to run once we have the coordinates.
    // We also set it to a variable, so we can know
    // right away if it's working or not
    
    var lookup = jQT.updateLocation(function(coords){
        if (coords) {
            setDisplay('Latitude: ' + coords.latitude + '<br />Longitude: ' + coords.longitude);
						$href = "http://m.lvh.me:3000/search"
						$href = $href + "?long=" + coords.longitude +"&lat=" + coords.latitude;
						window.location.replace($href);
        } else {
            setDisplay('Device not capable of geo-location.');
        }
    });

    if (lookup) {
        setDisplay('Looking up location&hellip;');
        
    }
});