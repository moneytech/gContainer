/* JReaderArrayObject.vala
 *
 * Copyright (C) 2016 aye7 <mr.aissat@gmail.com>
 *
 * Released under terms of Waqf Public License.
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the latest version Waqf Public License as
 * published by Ojuba.org.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * The Latest version of the license can be found on
 * "http://waqf.ojuba.org/license"
 */

using Gee;

namespace Jaa {
	public class JReaderArrayObject <T> : ArrayList <T> {

		private JReaderObject<T> _object ;

		public JReaderArrayObject (Json.Node   node ){
			if (node.get_node_type () == Json.NodeType.ARRAY){
				Json.Array JArray = node.get_array();
				foreach ( Json.Node iter in JArray.get_elements ()){
					if(iter.get_node_type () == Json.NodeType.OBJECT ){
					assert(iter.get_node_type () == Json.NodeType.OBJECT);
						_object = new JReaderObject<T>(iter);
						this.add(_object.get_object());
					}
				}
			}
		}
	}

}
