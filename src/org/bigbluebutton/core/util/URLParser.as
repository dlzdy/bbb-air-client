package org.bigbluebutton.core.util {
	
	public class URLParser {
		protected const reg:RegExp = /(?P<protocol>[a-zA-Z]+) : \/\/  (?P<host>[^:\/]*) (:(?P<port>\d+))?  (\/(?P<path>[^?]*))? (\?(?P<parameters>.*))? /x;
		
		private var _protocol:String;
		
		private var _host:String;
		
		private var _port:String;
		
		private var _path:String;
		
		private var _parameters:String;
		
		public function URLParser(url:String) {
			parse(url);
		}
		
		public function parse(url:String):void {
			var results:Array = reg.exec(url);
			_protocol = results.protocol;
			_host = results.host;
			_port = results.port;
			if (_port.length == 0) {
				_port = getDefaultPortByProtocol(_protocol);
			}
			_path = results.path;
			_parameters = results.parameters;
		}
		
		private function getDefaultPortByProtocol(protocol:String):String {
			switch (protocol) {
				case "http":
					return "80";
				case "https":
					return "443";
				case "rtmp":
					return "1935";
				default:
					return "";
			}
		}
		
		public function get protocol():String {
			return _protocol;
		}
		
		public function set protocol(value:String):void {
			_protocol = value;
			_port = getDefaultPortByProtocol(_protocol);
		}
		
		public function get host():String {
			return _host;
		}
		
		public function get port():String {
			return _port;
		}
		
		public function get path():String {
			return _path;
		}
		
		public function set path(value:String):void {
			_path = value;
		}
		
		public function get parameters():String {
			return _parameters;
		}
		
		public function set parameters(value:String):void {
			_parameters = value;
		}
		
		public function getParameter(value:String):String {
			var params:Array = _parameters.split("&");
			for (var i:int = 0; i < params.length; ++i) {
				if (params[i].indexOf(value + "=") != -1) {
					return params[i].split("=")[1];
				}
			}
			return null;
		}
		
		public function toString():String {
			var s:String = protocol + "://" + host;
			if (port.length > 0) {
				s += ":" + port;
			}
			if (path.length > 0 || parameters.length > 0) {
				s += "/";
			}
			if (path.length > 0) {
				s += path;
			}
			if (parameters.length > 0) {
				s += "?" + parameters;
			}
			return s;
		}
	}
}
