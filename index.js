var MongoClient = require ('mongodb').MongoClient;
var express = require ('express');
var app = express();
var http = require ('http');


//Databases:
	// products
	// users ?? 6 digit id , 36?-ary tree structure , 7 digit for companies $...

var products;

MongoClient.connect('mongodb://localhost:27017/noname', function (err, db)
{
	if (err) throw err;

	products = db.collection('products');
});
//
//	products.insert({'name': 'Doritos', 

var path = require ('path');


app.set ('port', process.env.PORT || 3000);
app.set ('views', path.join(__dirname, 'views'));
app.set ('view engine', 'jade');

var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

/////////////// TEST

app.get('/', function(req, res)
{
	console.log("Get request made");
	res.send("Hi there\n\n\n");
});

app.post('/', function(req, res)
{
	console.log('Post request made');
	console.log('body: ');
	console.log(JSON.stringify(req.body));
	res.send(JSON.stringify(req.body));
});




// GET
app.get('/users', function(request, response)
{

});

app.get('/users/:user', function(request, response)
{

});

app.get('/products', function(request, response)
{

});

app.get('/products/:item', function(request, response)
{

});


// PUT

app.put('/users', function(request, response)
{
});

app.put('/users/:user', function(request, response)
{
});

app.put('/products', function(request, response)
{
});

app.put('/products/:item', function(request, response)
{
});



// POST
//	db.collection('products').insert

app.post('/users', function(request, response)
{
});

app.post('/users/:user', function(request, response)
{
});

app.post('/products', function(request, response)
{
});

app.post('/products/:item', function(request, response)
{
});


// DELETE

app.delete('/users', function(request, response)
{
});

app.delete('/users/:user', function(request, response)
{
});

app.delete('/products', function(request, response)
{
});

app.delete('/products/:item', function(request, response)
{
});


// 404 not found

app.use(function(err, req, res, next)
{
	console.error(err.stack);
	res.render('404', {url : req.url});
	res.status(404).send();
});


http.createServer(app).listen(app.get('port'), function()
{
	console.log('Server listening on port ' + app.get('port'));
});


