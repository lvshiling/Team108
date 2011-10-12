package com.tan12.shuihu.protocol.protobuf
{
	import flash.errors.IOError;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	
	import mx.states.State;

	
	public class ProtobufParser extends Object {
		
		private static const STATE_HEADER_LENGTH_BYTE_ONE:int = 0;
		private static const STATE_HEADER_LENGTH_BYTE_TWO:int = 1;
		private static const STATE_HEADER_LENGTH:int =2;
		private static const STATE_HEADER:int = 3;
		private static const STATE_BODY:int = 4;
		
		private static const MAX_BODY_LENGTH:uint = 16777216;	// 2 ** 24
		
		private var messgae_handler:IProtobufParserMessageHandler;
		
		private var header_length:uint;
		private var state:int;
		private var buffer:ByteArray = new ByteArray();
		private var header:Header = new Header();
		
		
		public function ProtobufParser(message_handler:IProtobufParserMessageHandler) {
			Reset();
			this.messgae_handler = message_handler;
		}
		
		public function Parse(data:ByteArray):Boolean {
			if (data.length == 0) {
				return true;
			}
			
			var saved_position:uint = buffer.position;
			buffer.writeBytes(data);
			buffer.position = saved_position;
		
			var ba:ByteArray = new ByteArray();
			
			while (buffer.bytesAvailable > 0) {
				switch (this.state) {
					case STATE_HEADER_LENGTH_BYTE_ONE:
						header_length = buffer.readUnsignedByte();
						if (header_length >> 7) {
							header_length &= 0x7F;
							if (buffer.bytesAvailable > 0) {
								header_length |= ((buffer.readUnsignedByte() &0x7F) << 7);
								state = STATE_HEADER;
							} else {
								state = STATE_HEADER_LENGTH_BYTE_TWO;
								return true;
							}
						} else {
							state = STATE_HEADER;
						}
						break;
					
					case STATE_HEADER_LENGTH_BYTE_TWO:
						header_length |= ((buffer.readUnsignedByte() &0x7F) << 7);
						state = STATE_HEADER;
						break;
					
					case STATE_HEADER:
						if (buffer.bytesAvailable >= header_length) {
							ba.clear();
							buffer.readBytes(ba, 0, header_length);
							try {
								header.mergeFrom(ba);
							} catch (e:IOError) {
								trace(e);
								return false;
							}
							if (header.bodyLength > MAX_BODY_LENGTH) {
								return false;
							}
							if (header.bodyLength == 0) {
								messgae_handler.OnMessage(header);
								ResetState();
							} else {
								state = STATE_BODY;
							}
						} else {
							return true;
						}
						break;
					
					case STATE_BODY:
						if (buffer.bytesAvailable >= header.bodyLength) {
							ba.clear();
							buffer.readBytes(ba, 0, header.bodyLength);
							this.messgae_handler.OnMessage(header, ba);
							ResetState();
						} else {
							return true;
						}
						break;
					
					default:
						return false;
						break;
				}
			}
			return true;
		}
		
		private function ResetState():void {
			state = STATE_HEADER_LENGTH_BYTE_ONE;
			header_length = 0;
		}
		
		public function Reset():void {
			buffer.clear();
			ResetState();
		}
	}
}
