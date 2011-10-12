package com.tan12.shuihu.protocol.protobuf {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LoginR extends com.netease.protobuf.Message {
		public static const FOO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.tan12.shuihu.protocol.protobuf.LoginR.foo", "foo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var foo$field:String;

		public function removeFoo():void {
			foo$field = null;
		}

		public function get hasFoo():Boolean {
			return foo$field != null;
		}

		public function set foo(value:String):void {
			foo$field = value;
		}

		public function get foo():String {
			return foo$field;
		}

		public static const BAR:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.tan12.shuihu.protocol.protobuf.LoginR.bar", "bar", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var bar$field:String;

		public function removeBar():void {
			bar$field = null;
		}

		public function get hasBar():Boolean {
			return bar$field != null;
		}

		public function set bar(value:String):void {
			bar$field = value;
		}

		public function get bar():String {
			return bar$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFoo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, foo$field);
			}
			if (hasBar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, bar$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var foo$count:uint = 0;
			var bar$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (foo$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginR.foo cannot be set twice.');
					}
					++foo$count;
					this.foo = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (bar$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginR.bar cannot be set twice.');
					}
					++bar$count;
					this.bar = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
