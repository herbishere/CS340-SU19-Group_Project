function deletePlayerChampionship(championshipID, playerID) {
    // $.ajax({
    //     url: '/player_championships/year/' + championshipID + '/playerID/' + playerID,
    //     type: 'DELETE',
    //     success: function(result){
    //         if (result.responseText != undefined) {
    //             alert(result.responseText)
    //         } else {
    //             window.location.reload(true)
    //         }
    //     }
    // })
    var req = new XMLHttpRequest();
    var payload = {
        "championshipID": championshipID,
        "playerID": playerID
    }
    var url = '/player_championships/year/' + championshipID + '/playerID/' + playerID
    req.open("DELETE", url, true);
    req.setRequestHeader("Content-Type", "application/json");
    req.addEventListener("load", function () {
        if (req.status < 200 && req.status >= 400) {
            console.log("Error:" + req.statusText);
        }
    });
    req.send(JSON.stringify(payload));
}