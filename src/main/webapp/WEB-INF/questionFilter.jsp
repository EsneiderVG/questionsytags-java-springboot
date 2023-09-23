<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>question Filter</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto my-10">

        <h1 class="text-2xl font-medium text-gray-900 dark:text-white mr-4 mt-6">${question.question}</h1>
        <div class="flex mt-4">
            <c:forEach var="tag" items="${tags}">
                <p class="inline-block bg-aqua-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2 mb-2" style="border:2px solid black;">
                    ${tag}
                </p>
            </c:forEach>
        </div>
            <div class="flex mt-8">
                <div class="relative overflow-x-auto">
                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 ">
                        <thead class="text-base text-gray-700 bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="px-6 border-b dark:bg-gray-800 dark:border-gray-700">
                                    Answers
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="question_a" items="${question.getAnswers()}">
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                                
                                <td class="px-6 py-4">
                                    ${question_a.answer}
                                </td>   
        
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="ml-6">
                    <div class="flex">
                        <form:form action="/questions/${question.id}/new" method="post" modelAttribute="answerQ">   
                            <h1 class="text-xl font-medium text-gray-900 dark:text-white mr-4">Add your answer</h1> 
                            <div class="mb-6 flex items-center">
                                
                                <form:label 
                                for="message" 
                                class="block mb-2 text-base font-medium text-gray-900 dark:text-white mr-4"
                                path="answer"
                                >Answer</form:label>

                                <form:textarea path="answer" class="block p-2.5 w-full text-sm text-gra
                                y-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                                placeholder="Write your thoughts here..."
                                style="width: 400px;"
                                id="answer"
                                />
                                

                                <span>${error}</span>
                                <form:errors path="answer"/>
                            </div>
                            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
                        </form:form>
                    </div>
                </div>
            </div>
    </div>
</body>
</html>