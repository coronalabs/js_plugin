// 
// myplugin_js.js
// Copyright (c) 2018 Corona Labs Inc. All rights reserved.
//

// JS plugin is an child object of 'window'
window.myplugin_js = 
{
	// all the 1st-level functions are available to call from Lua
	// so 'get' and 'set' functions are available to call from Lua
	data:{},

	// function may use up to 10 args; use Object or Array if you want to pass more than 10 args
	// arg maybe a Number, String, Boolean, Array or Object
	set: function(bool_arg, number_arg, string_arg, table_arg, array_arg)
	{
		console.log('js set() is called');
	  
		var data = window.myplugin_js.data;
		data.bool_arg = bool_arg; 
		data.number_arg = number_arg; 
		data.string_arg = string_arg; 
		data.table_arg = table_arg; 
		data.array_arg = array_arg; 

		// Lua callback
		// you can pass to Lua a Number, String, Boolean, Array or Object args
		this.dispatchEvent({ name: 'onData', data: {
		  arg1: bool_arg, arg2: number_arg, arg3: string_arg, arg4: table_arg, arg5: array_arg
		}})

		console.log(typeof(bool_arg));	
		console.log(typeof(number_arg));	
		console.log(typeof(string_arg));	
		console.log(typeof(table_arg));	
		console.log(typeof(array_arg), array_arg.length);	
	},

	get: function()
	{
		var data = window.myplugin_js.data;
		console.log('js get() is called', data);
		return data;
	}

};
console.log('myplugin_js is loaded');
