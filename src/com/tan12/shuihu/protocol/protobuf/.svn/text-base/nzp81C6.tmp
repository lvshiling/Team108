package com.tan12.shuihu.protocol.protobuf
{
	import com.netease.protobuf.Message;
	import com.tan12.shuihu.protocol.protobuf.Login;
	import com.tan12.shuihu.protocol.protobuf.events.ProtobufMessageEvent;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;

	
	public class ProtobufConnection extends Socket implements IProtobufParserMessageHandler {
		private var parser:ProtobufParser;
		
		public function ProtobufConnection() {
			super();
			
			parser = new ProtobufParser(this);
			registerListeners();
		}
		
		private function registerListeners():void {
			addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
		}
		
		protected function socketDataHandler(event:ProgressEvent):void {
			trace("socketDataHandler");
			
			var ba:ByteArray = new ByteArray();
			readBytes(ba, 0, bytesAvailable);
			if (!parser.Parse(ba)) {
				var e:ProtobufMessageEvent = new ProtobufMessageEvent(ProtobufMessageEvent.ILLEGAL_MESSAGE);
				dispatchEvent(e);
				parser.Reset();
			}
		}
		
		public function OnMessage(header:Header, body:ByteArray=null):void {
			var event:ProtobufMessageEvent = new ProtobufMessageEvent(ProtobufMessageEvent.ON_MESSAGE, header, body);
			dispatchEvent(event);
		}
		
		public function SendMessageWithType(type:int, m:Message):Boolean {
			try {
				Utils.WritePacketWithType(type, m, this);
			} catch (e:IOError) {
				trace(e);
				return false;
			}
			return true;
		}
		
		public function SendMessageWithHeader(h:Header, m:Message):Boolean {
			try {
				Utils.WritePacketWithHeader(h, m, this);
			} catch (e:IOError) {
				trace(e);
				return false;
			}
			return true;
		}
	}
}
