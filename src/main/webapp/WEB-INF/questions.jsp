<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questions</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto">
        <h1 class="text-2xl mb-6">Question Dashboard</h1>
        <div class="relative overflow-x-auto mb-8">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-6 py-3">
                            Question
                        </th>
                        <th class="px-6 py-3">
                            Tag
                        </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="question" items="${questions}">
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        
                        <td class="px-6 py-4">
                            <a href="/questions/${question.id}">
                                ${question.question}
                            </a>
                            
                        </td>  
                        <td class="px-6 py-4">
                            <c:forEach var="tag" items="${question.getTags()}">
                                ${tag.subject}
                            </c:forEach>
                        </td>   

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <a href="/questions/new" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" style="float: right;">New Question</a>
    </div>
</body>
</html>