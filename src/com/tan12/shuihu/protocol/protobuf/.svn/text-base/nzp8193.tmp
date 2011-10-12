package com.tan12.shuihu.protocol.protobuf {
	import com.netease.protobuf.*;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.tan12.shuihu.protocol.protobuf.Status;
	import com.tan12.shuihu.protocol.protobuf.Header.MessageType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Header extends com.netease.protobuf.Message {
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("com.tan12.shuihu.protocol.protobuf.Header.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, com.tan12.shuihu.protocol.protobuf.Header.MessageType);

		public var type:int;

		public static const STATUS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.tan12.shuihu.protocol.protobuf.Header.status", "status", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, com.tan12.shuihu.protocol.protobuf.Status);

		private var status$field:com.tan12.shuihu.protocol.protobuf.Status;

		public function removeStatus():void {
			status$field = null;
		}

		public function get hasStatus():Boolean {
			return status$field != null;
		}

		public function set status(value:com.tan12.shuihu.protocol.protobuf.Status):void {
			status$field = value;
		}

		public function get status():com.tan12.shuihu.protocol.protobuf.Status {
			return status$field;
		}

		public static const BODY_LENGTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.tan12.shuihu.protocol.protobuf.Header.body_length", "bodyLength", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var body_length$field:uint;

		private var hasField$0:uint = 0;

		public function removeBodyLength():void {
			hasField$0 &= 0xfffffffe;
			body_length$field = new uint();
		}

		public function get hasBodyLength():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set bodyLength(value:uint):void {
			hasField$0 |= 0x1;
			body_length$field = value;
		}

		public function get bodyLength():uint {
			return body_length$field;
		}

		public static const SEQUENCE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("com.tan12.shuihu.protocol.protobuf.Header.sequence", "sequence", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sequence$field:uint;

		public function removeSequence():void {
			hasField$0 &= 0xfffffffd;
			sequence$field = new uint();
		}

		public function get hasSequence():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sequence(value:uint):void {
			hasField$0 |= 0x2;
			sequence$field = value;
		}

		public function get sequence():uint {
			return sequence$field;
		}

		public static const ARG1:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.tan12.shuihu.protocol.protobuf.Header.arg1", "arg1", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var arg1$field:String;

		public function removeArg1():void {
			arg1$field = null;
		}

		public function get hasArg1():Boolean {
			return arg1$field != null;
		}

		public function set arg1(value:String):void {
			arg1$field = value;
		}

		public function get arg1():String {
			return arg1$field;
		}

		public static const ARG2:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.tan12.shuihu.protocol.protobuf.Header.arg2", "arg2", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var arg2$field:String;

		public function removeArg2():void {
			arg2$field = null;
		}

		public function get hasArg2():Boolean {
			return arg2$field != null;
		}

		public function set arg2(value:String):void {
			arg2$field = value;
		}

		public function get arg2():String {
			return arg2$field;
		}

		/**
		 *  @private
		 */
		override public final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.type);
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, status$field);
			}
			if (hasBodyLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, body_length$field);
			}
			if (hasSequence) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_UINT32(output, sequence$field);
			}
			if (hasArg1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, arg1$field);
			}
			if (hasArg2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, arg2$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override public final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var status$count:uint = 0;
			var body_length$count:uint = 0;
			var sequence$count:uint = 0;
			var arg1$count:uint = 0;
			var arg2$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.status cannot be set twice.');
					}
					++status$count;
					this.status = new com.tan12.shuihu.protocol.protobuf.Status();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.status);
					break;
				case 3:
					if (body_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.bodyLength cannot be set twice.');
					}
					++body_length$count;
					this.bodyLength = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 4:
					if (sequence$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.sequence cannot be set twice.');
					}
					++sequence$count;
					this.sequence = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
					break;
				case 5:
					if (arg1$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.arg1 cannot be set twice.');
					}
					++arg1$count;
					this.arg1 = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (arg2$count != 0) {
						throw new flash.errors.IOError('Bad data format: Header.arg2 cannot be set twice.');
					}
					++arg2$count;
					this.arg2 = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
