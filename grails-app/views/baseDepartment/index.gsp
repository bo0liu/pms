
<%@ page import="com.petrodata.pms.core.BaseDepartment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="superAdmin">
		<g:set var="entityName" value="${message(code: 'baseDepartment.label', default: 'BaseDepartment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

        <script >


           $(function(){
                $('#ckAll').on('ifChecked', function(event) {
                    $('.listcheckone').iCheck('check');
                });
                $('#ckAll').on('ifUnchecked', function(event) {
                    $('.listcheckone').iCheck('uncheck');
                });
            });
        </script>


	</head>
	<body>

		<div >

				<a  href="${createLink(uri: '/')}"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.home.label"/></button></a>
				<g:link  action="create"><button class="btn btn-info btn-sm m-t-10"><g:message code="default.new.label" args="[entityName]" /></button></g:link>

		</div>
		<div id="list-baseDepartment" class="content scaffold-list" role="main">

			<h1 class="block-title"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<g:form method="post">

    <table class="table tile">
			<thead>
					<tr>
                        <th> <input type="checkbox" name="ckAll" id="ckAll" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'baseDepartment.name.label', default: 'Name')}" />

					

						<th><g:message code="baseDepartment.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="isContainer" title="${message(code: 'baseDepartment.isContainer.label', default: 'Is Container')}" />

					
						<g:sortableColumn property="isTeam" title="${message(code: 'baseDepartment.isTeam.label', default: 'Is Team')}" />

					
                        <th>操作</th>
                    </tr>
				</thead>
				<tbody>
				<g:each in="${baseDepartmentInstanceList}" status="i" var="baseDepartmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><input type="checkbox" class="listcheckone" name="ids" value="${baseDepartmentInstance.id }"  style="vertical-align: middle;"/></td>
                        

						<td><g:link action="show" id="${baseDepartmentInstance.id}">${fieldValue(bean: baseDepartmentInstance, field: "name")}</g:link></td>

					

                        <td><g:link action="show" id="${baseDepartmentInstance.id}">${fieldValue(bean: baseDepartmentInstance, field: "parent")}</g:link></td>
					
						<td><g:formatBoolean boolean="${baseDepartmentInstance.isContainer}" /></td>
                        <td><g:link action="show" id="${baseDepartmentInstance.id}">${fieldValue(bean: baseDepartmentInstance, field: "isContainer")}</g:link></td>

					
						<td><g:formatBoolean boolean="${baseDepartmentInstance.isTeam}" /></td>
                        <td><g:link action="show" id="${baseDepartmentInstance.id}">${fieldValue(bean: baseDepartmentInstance, field: "isTeam")}</g:link></td>

					
                        <td><g:link action="edit" id="${baseDepartmentInstance.id}"  >编辑</g:link>|
                            <a href="javascript:if(window.confirm('确认删除吗？')) window.location.href='${request.getContextPath()}/baseDepartment/delete/${baseDepartmentInstance.id }';">删除 </a></td>
					</tr>
				</g:each>
				</tbody>
                <div> <g:actionSubmit class="btn btn-info btn-sm m-t-10" onclick="return confirm('确定删除吗');" action="deleteAll"  value="删除" /></div>

            </table>
    </g:form>
			<div class="pagination">

				<g:paginate total="${baseDepartmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>