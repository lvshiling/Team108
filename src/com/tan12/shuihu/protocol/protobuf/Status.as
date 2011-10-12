package com.tan12.shuihu.protocol.protobuf {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.tan12.shuihu.protocol.protobuf.Status.Code;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Status extends com.netease.protobuf.Message {
		public static const CODE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.tan12.shuihu.protocol.protobuf.Status.code", "code", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.tan12.shuihu.protocol.protobuf.Status.Code);

		public var code:int;

		public static const DESCRIPTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.tan12.shuihu.protocol.protobuf.Status.description", "description", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var description$field:String;

		public function removeDescription():void {
			description$field = null;
		}

		public function get hasDescription():Boolean {
			return description$field != null;
		}

		public function set description(value:String):void {
			description$field = value;
		}

		public function get description():String {
			return description$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.code);
			if (hasDescription) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, description$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var code$count:uint = 0;
			var description$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (code$count != 0) {
						throw new flash.errors.IOError('Bad data format: Status.code cannot be set twice.');
					}
					++code$count;
					this.code = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (description$count != 0) {
						throw new flash.errors.IOError('Bad data format: Status.description cannot be set twice.');
					}
					++description$count;
					this.description = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
