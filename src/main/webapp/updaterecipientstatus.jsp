
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Recipient Status</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
        }

        /* Navbar styling */
        .navbar {
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            bottom: 0;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Header styling */
        h3 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-top: 30px;
            font-size: 24px;
            text-decoration: underline;
        }

        /* Table container styling */
        .table-container {
            margin-left: 260px; /* Space for fixed sidebar */
            width: 80%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Table styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Table headers styling */
        th {
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            text-align: left;
            font-size: 16px;
        }

        /* Table cells styling */
        td {
            padding: 10px 15px;
            text-align: left;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        /* Table row hover effect */
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Table border */
        table, th, td {
            border: 1px solid #ddd;
        }

        /* Accept and Reject button styling */
        .accept-link, .reject-link {
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        .accept-link {
            color: #27ae60;
            border: 1px solid #27ae60;
        }

        .reject-link {
            color: #e74c3c;
            border: 1px solid #e74c3c;
        }

        /* Hover effects for Accept and Reject buttons */
        .accept-link:hover {
            background-color: #27ae60;
            color: white;
        }

        .reject-link:hover {
            background-color: #e74c3c;
            color: white;
        }

        /* Row hover effect */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .table-container {
                margin-left: 0;
                width: 100%;
            }

            table {
                width: 100%;
            }

            th, td {
                font-size: 12px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>

    <div class="table-container">
        <h3>Update Recipient Status</h3>
        <table border="2">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>GENDER</th>
                <th>DATE OF BIRTH</th>
                <th>LOCATION</th>
                <th>EMAIL</th>
                <th>CONTACT</th>
                <th>STATUS</th>
                <th>ACTION</th>
            </tr>
            <c:forEach items="${recipientlist}" var="recipient">
                <tr>
                    <td><c:out value="${recipient.id}"/></td>
                    <td><c:out value="${recipient.name}"/></td>
                    <td><c:out value="${recipient.gender}"/></td>
                    <td><c:out value="${recipient.dateofbirth}"/></td>
                    <td><c:out value="${recipient.location}"/></td>
                    <td><c:out value="${recipient.email}"/></td>
                    <td><c:out value="${recipient.contact}"/></td>
                    <td><c:out value="${recipient.status}"/></td>
                    <td>
                        <a class="accept-link" href='<c:url value="updatestatus?id=${recipient.id}&status=Accepted"></c:url>'>Accept</a>
                        <a class="reject-link" href='<c:url value="updatestatus?id=${recipient.id}&status=Rejected"></c:url>'>Reject</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
