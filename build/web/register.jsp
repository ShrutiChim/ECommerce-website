<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>BookNest Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body style="background-image: url('https://images.unsplash.com/photo-1512820790803-83ca734da794'); background-size: cover; background-position: center; background-repeat: no-repeat;">

<div class="min-vh-100 d-flex align-items-center justify-content-center bg-dark bg-opacity-50">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 col-lg-5">
        <div class="card shadow">
          <div class="card-body">
            <h3 class="text-center mb-4">Register at BookNest</h3>

            <%-- Display error message from RegisterServlet --%>
            <%
              String error = (String) request.getAttribute("error");
              if (error != null) {
            %>
              <div class="alert alert-danger"><%= error %></div>
            <% } %>

            <form action="RegisterServelet" method="post">
              <div class="mb-3">
                <label for="fullname" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullname" name="fullname" required />
              </div>
              <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required minlength="4" maxlength="20"/>
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required />
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
               <input type="password" name="password" class="form-control" required
               pattern="(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}"
                title="At least 8 characters, 1 uppercase, 1 lowercase, and 1 digit" />

              </div>
              <div class="mb-3">
                <label for="gender" class="form-label">Gender</label>
                <select class="form-select" id="gender" name="gender" required>
                  <option selected disabled value="">Choose...</option>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="genre" class="form-label">Favorite Book Genre</label>
                <select class="form-select" id="genre" name="genre" required>
                  <option selected disabled value="">Select genre</option>
                  <option>Fiction</option>
                  <option>Science & Technology</option>
                  <option>Biographies</option>
                  <option>Self Help</option>
                  <option>Children</option>
                  <option>History</option>
                </select>
              </div>
              <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
