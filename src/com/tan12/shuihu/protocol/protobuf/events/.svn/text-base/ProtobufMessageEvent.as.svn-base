package com.tan12.shuihu.protocol.protobuf.events
{
	import com.tan12.shuihu.protocol.protobuf.Header;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class ProtobufMessageEvent extends Event {
		public static const ON_MESSAGE:String = "onMessage";
		public static const ILLEGAL_MESSAGE:String = "illegalMessage";
		
		public var header:Header;
		public var body:ByteArray;
		
		public function ProtobufMessageEvent(type:String, header:Header = null, body:ByteArray = null) {
			super(type);
			this.header = header;
			this.body = body;
		}
	}
}