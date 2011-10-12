package com.tan12.shuihu.protocol.protobuf
{	
	import com.netease.protobuf.Message;
	
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public final class Utils {
		
		public static function WritePacketWithType(type:int, m:Message, socket:Socket):void {
			var header:Header = new Header();
			header.type = type;
			WritePacketWithHeader(header, m, socket);
		}
		
		public static function WritePacketWithHeader(h:Header, m:Message, socket:Socket):void {
			var ba_h:ByteArray = new ByteArray();
			var ba_m:ByteArray = new ByteArray();
			
			m.writeTo(ba_m);
			h.bodyLength = ba_m.length;
			
			h.writeTo(ba_h);
			
			WriteVariableLengthUnsignedInt(ba_h.length, socket);
			socket.writeBytes(ba_h);
			socket.writeBytes(ba_m);
		}
		
		// NOTE: Now we only encode two bytes.
		private static function WriteVariableLengthUnsignedInt(val:uint, socket:Socket):void {
			if (val < 0x80) {
				socket.writeByte(val);
			} else {
				socket.writeByte((val & 0x7F) | 0x80);
				socket.writeByte(val >> 7 & 0x7F);
			}
		}
	}
}