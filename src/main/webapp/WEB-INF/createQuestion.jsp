<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>create Question</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="container mx-auto mt-6">
        <form:form action="/questions/new" method="post" modelAttribute="questiontag"> 
            <h1 class="text-2xl	mb-5">New Question</h1>
            <div class="mb-6">

                <form:label 
                    for="question" 
                    class="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
                    path="question"
                    >
                    Your Question
                </form:label>
                            
                <form:textarea path="question" class="block p-2.5 w-full text-sm text-gra
                y-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                placeholder="Write your thoughts here..."
                />
                <span>${error}</span>
                <form:errors path="question"/>
            </div>

            <div class="mb-6">
    
                <label for="tags" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                    Tags
                </label>
              
                <input 
                    type="text" 
                    id="tags"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
                    name="etiquetas"
                />
                <span>${error}</span>
            </div>

            <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
        </form:form> 
    </div>
            
        
</body>
</html>