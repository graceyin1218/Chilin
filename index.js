var MongoClient = require ('mongodb').MongoClient;
var express = require ('express');
var app = express();

//Databases:
	// products
	// users ?? 6 digit id , 36?-ary tree structure , 7 digit for companies $...


MongoClient.connect('mongodb://localhost:27017/noname', function (err, db)
{
	if (err) throw err;

	var products = db.collection('products');
//
//	products.insert({'name': 'Doritos', 


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
		res.status(404).send();
	});

});
