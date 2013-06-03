/*
  This file is part of Daxe.

  Daxe is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Daxe is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Daxe.  If not, see <http://www.gnu.org/licenses/>.
*/

part of nodes;

class DNCData extends DaxeNode {
  Tag _b1, _b2;
  
  DNCData() : super.fromNodeType(DaxeNode.CDATA_SECTION_NODE) {
    _b1 = new Tag(this, Tag.START);
    _b2 = new Tag(this, Tag.END);
  }
  
  DNCData.fromNode(x.Node node, DaxeNode parent) : super.fromNode(node, parent) {
    _b1 = new Tag(this, Tag.START);
    _b2 = new Tag(this, Tag.END);
  }
  
  @override
  h.Element html() {
    h.Element span;
    span = new h.SpanElement();
    span.id = "$id";
    span.classes.add('dn');
    span.append(_b1.html());
    h.SpanElement contents = new h.SpanElement();
    contents.appendText(nodeValue);
    span.append(contents);
    span.append(_b2.html());
    return(span);
  }
  
  @override
  h.Element getHTMLContentsNode() {
    return(getHTMLNode().nodes[1]);
  }
}
