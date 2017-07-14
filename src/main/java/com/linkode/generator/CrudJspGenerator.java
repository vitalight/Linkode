package com.linkode.generator;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.*;
import com.linkode.generator.Table;

public class CrudJspGenerator {
	private static String jsPath, jspPath;
	private static List<Table> tables;
	private static boolean verbose=false;
	private static boolean overwriteJs=false;
	private static boolean overwriteJsp=false;
	
	private static boolean loadXML() {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		tables = new ArrayList<Table>();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse("src/main/resources/crudJspConfig.xml");
			
			Element location = (Element)doc.getElementsByTagName("location").item(0);
			
			jsPath = location.getAttribute("jsPath");
			jspPath = location.getAttribute("jspPath");
			
			Element config = (Element)doc.getElementsByTagName("config").item(0);
			
			verbose = config.getAttribute("verbose").equals("true") ? true : false ;
			overwriteJs = config.getAttribute("overwriteJs").equals("true") ? true : false;
			overwriteJsp = config.getAttribute("overwriteJsp").equals("true") ? true : false;
			
			if (jsPath=="") {
				System.out.println("<ERROR> XML contains no information for jsPath.");
				return false;
			} else if (jspPath=="") {
				System.out.println("<ERROR> XML contains no infromation for jspPath");
				return false;
			}
			
			NodeList tableList = doc.getElementsByTagName("table");
			
			for (int i=0; i<tableList.getLength(); i++) {
				Table table = new Table();
				Element tableElem = (Element) tableList.item(i);
				table.name = tableElem.getAttribute("name");
				NodeList fieldList = tableElem.getElementsByTagName("field");
				
				for (int j=0; j<fieldList.getLength(); j++) {
					Element fieldElem = (Element) fieldList.item(j);
					String name = fieldElem.getAttribute("name"),
							type = fieldElem.getAttribute("type");
					if ((name == "" || type == "") || 
							(!(type.equals("int") || type.equals("pk") || type.equals("string") || type.equals("datetime") || type.equals("date")))) {
						System.out.println("<ERROR> ["+table.name+"] has a field with illegal input ["+name+", "+type+"]");
						return false;
					}
					table.fieldNames.add(name.toLowerCase());
					table.fieldTypes.add(type);
					table.originalNames.add(name);
				}
				tables.add(table);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	private static void test() {
		System.out.println("============================================\n"
							+ "JS PATH :   " + jsPath + "\n"
							+ "JSP PATH:   " + jspPath + "\n"
							+ "OverwriteJs:" + (overwriteJs?"True":"False") + "\n"
							+ "OverwriteJsp:" + (overwriteJsp?"True":"False") + "\n");
		for (Table table:tables) {
			System.out.println("  * "+table.name);
			for (int i=0; i<table.fieldNames.size(); i++) {
				System.out.println("    - "+table.fieldNames.get(i) + " : " + table.fieldTypes.get(i));
			}
		}

		System.out.println("============================================");
	}
	
	/**
	 *	This function is a completely mess that you don't need to read through.
	 *	You just need to know it generate [.js file] for the given [table]. 
	 */
	private static void generateJs(Table table) {
		String filename = jsPath + "/"+ table.name +".js";
		File file = new File(filename);
		FileWriter fw = null;
		
		if (file.exists()) {
			if (verbose) {
				System.out.println("Existing File ["+filename+"]");
			}
			if (!overwriteJs) {
				return;
			}
		}
		try {
			file.createNewFile();
			fw = new FileWriter(file);

			/*======== 下面是生成内容 ========*/
			fw.write("$(function() {\n" +
						"$(\"#save\").click(function(e) {\n");
			for (int i=1; i<table.fieldNames.size(); i++) {
				fw.write("var "+table.fieldNames.get(i)+" = $(\"input[name='" + table.fieldNames.get(i)  + "']\").val();\n");
			}
			fw.write("var dataset = e.currentTarget.dataset;\n" +
					"var id = dataset.id;\n");
			fw.write("if (id != \"\") {\n" +
						"jQuery.ajax({\n" +
							"url : '/Linkode/admin/"+table.name+"/update',\n"+
							"processData : true,\n" +
							"dataType : \"text\",\n");
			fw.write("data : {\n");
			for (int i=0; i<table.fieldNames.size();i++) {
				fw.write(table.originalNames.get(i)+" : "+table.fieldNames.get(i)+",\n");
			}
			fw.write("},\n" +
							"complete : function(data) {\n" +
								"bootbox.alert({\n" +
									"message : '修改成功~',\n" +
									"callback : function() {\n" +
										"location.reload();\n" +
									"}\n" +
								"});\n" +
							"}\n" +
						"});\n");
			
			/* Add Part */
			fw.write("	} else { // Add\n" +
						"jQuery.ajax({\n" +
							"url : '/Linkode/admin/"+ table.name +"/create',\n" +
							"processData : true,\n" +
							"dataType : \"text\",\n" +
							"data : {\n");
			for (int i=0; i<table.fieldNames.size(); i++) {
				fw.write(table.originalNames.get(i) + " : " + table.fieldNames.get(i) + ",\n");
			}
			fw.write("		},\n" +
							"complete : function(data) {\n" +
								"bootbox.alert({\n" +
									"message : '插入成功~',\n" +
									"callback : function() {\n" +
										"location.reload();\n" +
									"}\n" +
								"});\n" +
							"}\n" +
						"})\n" +
					"}\n" +
					"$('#modal').modal('hide');\n" +
				"});\n");
			
			/* Delete Part */
			fw.write("	$(\".delete\").click(function(e) {\n" +
					"bootbox.confirm({\n" +
						"buttons : {\n" +
							"confirm : {\n" +
								"label : '删除'\n" +
							"},\n" +
							"cancel : {\n" +
								"label : '取消'\n" +
							"}\n" +
						"},\n" +
						"message : '确定删除？',\n" +
						"callback : function(result) {\n" +
							"if (result) {\n" +
								"var dataset = e.currentTarget.dataset;\n" +
								"var id = dataset.id;\n" +
								"jQuery.ajax({\n");
			fw.write(				"url : '/Linkode/admin/" + table.name + "/delete',\n" +
									"processData : true,\n" +
									"dataType : \"text\",\n" +
									"data : {\n" +
										"id : id,\n" +
									"},\n" +
										"complete : function(data) {\n" +
										"console.log(id);\n" +
										"bootbox.alert({\n" +
											"message : '成功删除',\n" +
											"callback : function() {\n" +
												"location.reload();\n" +
											"}\n" +
										"});\n" +
									"}\n" +
								"});\n" +
							"}\n" +
						"}\n" +
					"});\n" +
				"});\n");
			fw.write("$(\"#add\").click(function(e) {\n" +
					"$('#modalTitle').html(\"Add\");\n");
			for (int i=1; i<table.fieldNames.size(); i++) {
				fw.write("$(\"input[name='" + table.fieldNames.get(i)+ "']\").val('');\n");
			}
			fw.write("$(\"#save\").attr(\"data-id\", '');\n" +
					"$('#modal').modal('show');\n" +
					"});\n" +
					"$(\".edit\").click(function(e) {\n" +
					"$('#modalTitle').html(\"Edit\");\n" +
					"var dataset = e.currentTarget.dataset;\n" +
					"var id = dataset.id;\n");
					
			for (int i=1; i<table.fieldNames.size(); i++) {
				fw.write("$(\"input[name='" + table.fieldNames.get(i) + "']\").val(dataset." + table.fieldNames.get(i) + ");\n");
			}
			
			fw.write("$(\"#save\").attr(\"data-id\", dataset.id);\n" +
					"$('#modal').modal('show');\n" +
				"});\n" +
				"});\n" +
			 "\n");
			/*======== 上面是生成内容 ========*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fw!=null) {
					fw.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("Generating success to [" + filename + "]");
	}

	/**
	 *	This function is a completely mess that you don't need to read through.
	 *	You just need to know it generate [.jsp file] for the given [table]. 
	 */
	private static void generateJsp(Table table) {
		String filename = jspPath + "/"+ table.name +".jsp";
		File file = new File(filename);
		FileWriter fw = null;
		
		if (file.exists()) {
			if (verbose) {
				System.out.println("Existing File ["+filename+"]");
			}
			if (!overwriteJsp) {
				return;
			}
		}
		try {
			file.createNewFile();
			fw = new FileWriter(file);
			/*======== 下面是生成内容 ========*/
			fw.write("<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>\n" +
				"<% request.setAttribute(\"title\",\"" + table.name + "\"); %>\n" +
				"<%@ include file=\"../modules/web-header.jsp\"%><%@ include file=\"../modules/crud-header.jsp\" %>\n" +
				"</head><body><%@ include file=\"../modules/header.jsp\"%>\n" +
					"<c:set var=\"type\" value=\"" + table.name + "\"/>" + "<c:set var=\"headType\" value=\"admin\"/>"
							+ "<%@ include file=\"./crud-head.jsp\" %>\n" +
					"<div class=\"panel panel-default display bigger\">\n" +
						"<div class=\"panel-heading\">\n");
			fw.write(table.name);
			fw.write("<button class=\"btn btn-default\" type=\"button\" id=\"add\">\n" +
								"<i class=\"fa fa-plus\"></i></button></div> <!-- /.panel-heading -->\n" +
						"<div class=\"panel-body\"><div class=\"dataTable_wrapper\">\n" +
								"<table class=\"table table-striped table-bordered table-hover\" id=\"dataTables\">\n" +
									"<thead><tr>\n");
			/* Table Head */
			for (String str:table.originalNames) {
				fw.write("<th>"+str+"</th>");
			}
			fw.write("<th></th></tr></thead><tbody>\n");
			fw.write("<c:forEach items=\"${model}\" var=\"" + table.name + "\">\n");
			
			/* format java.util.date -> java.sql.date */
			for (int i=1; i<table.fieldTypes.size(); i++) {
				if (table.fieldTypes.get(i).equals("date")) {
					fw.write("<fmt:formatDate pattern=\"yyyy-MM-dd\" value=\"${" + table.name + 
							"." + table.originalNames.get(i) + "}\"" + " var=\"" + table.originalNames.get(i)+ "\"/>\n");
				} else if (table.fieldTypes.get(i).equals("datetime")) {
					fw.write("<fmt:formatDate pattern=\"yyyy-MM-dd hh:mm:ss\" value=\"${" + table.name + 
							"." + table.originalNames.get(i) + "}\"" + " var=\"" + table.originalNames.get(i)+ "\"/>\n");
				}
			}
			fw.write("<tr>\n");
			for (int i=0; i<table.fieldTypes.size(); i++) {
				if (table.fieldTypes.get(i).equals("date") || table.fieldTypes.get(i).equals("datetime")) {
					fw.write("<td>${"+table.originalNames.get(i)+"}</td>\n");
				} else {
					fw.write("<td>${" + table.name + "." + table.originalNames.get(i) + "}</td>");
				}
			}
			fw.write("<td><button class=\"btn btn-default delete\" type=\"button\" data-id=\"${" + table.name+".id}\">\n" +
					"<i class=\"fa fa-trash\"></i></button><button class=\"btn btn-default edit\" type=\"button\"\n");
			for (int i=0; i<table.fieldTypes.size(); i++) {
				fw.write("data-" + table.fieldNames.get(i) + "=\"${");
				if (table.fieldTypes.get(i).equals("date") || table.fieldTypes.get(i).equals("datetime")) {
					fw.write(table.originalNames.get(i) + "}\"\n");
				} else {
					fw.write(table.name + "." + table.originalNames.get(i) + "}\"\n");
				}
			
			}
			fw.write("><i class=\"fa fa-edit\"></i></button></td></tr></c:forEach></tbody></table></div></div> <!-- /.panel-body --></div> <!-- panel -->");
			fw.write("<div class=\"modal fade\" id=\"modal\" tabindex=\"-1\" role=\"dialog\"\n" +
						"aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n" +
						"<div class=\"modal-dialog\">\n" +
							"<div class=\"modal-content\">\n" +
								"<div class=\"modal-header\">\n" +
									"<button type=\"button\" class=\"close\" data-dismiss=\"modal\">\n" +
										"<span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">关闭</span>\n" +
									"</button>\n" +
									"<h4 class=\"modal-title\" id=\"modalTitle\"></h4>\n" +
								"</div>\n" +
								"<div class=\"modal-body\"><div class=\"row\"><div class=\"col-lg-12\"><form role=\"form\">\n");
			for (int i=1; i<table.originalNames.size(); i++) {
				fw.write("<div class=\"form-group\">\n<label>" + table.originalNames.get(i) + 
						"</label><input class=\"form-control\""); 
				if (table.fieldTypes.get(i).equals("date")) {
					fw.write(" type=\"date\" ");
				} else if (table.fieldTypes.get(i).equals("datetime")) {
					fw.write(" type=\"datetime\" ");
				} else if (table.fieldTypes.get(i).equals("int")) {
					fw.write(" type=\"number\" step=\"1\" ");
				}
				fw.write(" name=\"" + table.fieldNames.get(i) + "\" /></div>\n");
			}
			fw.write("</form></div></div></div><div class=\"modal-footer\">\n" +
					"<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">关闭</button>\n" +
					"<button type=\"button\" class=\"btn btn-primary\" id=\"save\">保存</button>\n" +
					"</div></div></div></div>\n" +
					"<%@ include file=\"../modules/javascript.jsp\"%>\n" +
					"<%@ include file=\"../modules/crud-footer.jsp\" %>\n" +
					"<script src=\"${pageContext.request.contextPath}/static/js/crud/" + table.name + ".js\"></script>\n" +
					"<%@ include  file=\"../modules/web-footer.jsp\"%>\n");
			
			/*======== 上面是生成内容 ========*/
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fw!=null) {
					fw.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("Generating success to [" + filename + "]");
	}
	
	public static void main(String[] args) {
		if (!loadXML()) {
			System.out.println("<ERROR> occured during reading XML file.");
		}
		if (verbose) {
			test();
		}
		for (Table table:tables) {
			generateJs(table);
			generateJsp(table);
		}
		System.out.println("Generating Over.");
	}
}
