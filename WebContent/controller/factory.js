/**
 * 
 */
app.factory("myfactory", ($http, $q) => {
    var object = {
        callServer(artistName) {
            var pr = $q.defer();
            var url = `https://itunes.apple.com/search?term=${artistName}&limit=25`;

            $http.get(url).then((response) => {
                pr.resolve(response);
            }, (err) => {
                pr.reject(err);
            });
            return pr.promise;
        }
    };
    return object;
})
