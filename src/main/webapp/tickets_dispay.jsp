<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="ticket">
  <div class="left">
    <div class="title">
      <span class="first-letter">V</span>
      <span>FOR VENDETTA</span>
    </div>
    <div class="date">
      <p>5th November.</p>
    </div>
    <img src="https://i.imgur.com/44Oubdx.png">
  </div>
  <div class="right">
    <div class="barcode"></div>
  </div>
</div>
</body>
</html>
<style>
@import url("https://fonts.googleapis.com/css?family=Alfa+Slab+One|Butcherman|Montserrat:900");
:root {
  --red: #c31224;
  --gray: #e9e9e9;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  width: 100vw;
  min-width: 600px;
  margin: 0;
  background: var(--red);
}

.ticket {
  position: relative;
  display: flex;
  flex-direction: row;
  min-height: 200px;
  min-width: 580px;
  margin: 10px;
  background: black;
}

.ticket::before,
.ticket::after {
  content: "";
  position: absolute;
  width: 40px;
  height: 40px;
  background: var(--red);
  border-radius: 50%;
  top: 80px;
}

.ticket::before {
  left: -15px;
}

.ticket::after {
  right: -15px;
}

.left {
  position: relative;
  width: 100%;
}

.title {
  position: absolute;
  display: flex;
  align-items: center;
  top: 50px;
  left: 35px;
  font-family: "Alfa Slab One", cursive;
  font-size: 28px;
  color: var(--red);
}

.first-letter {
  font-family: "Butcherman", cursive;
  font-size: 80px;
}

.date {
  position: absolute;
  top: 130px;
  left: 198px;
  font-family: "Montserrat", sans-serif;
  color: var(--gray);
}

img {
  position: absolute;
  height: 180px;
  top: 10px;
  right: -55px;
  animation: imageFilter 5s alternate 2;
}

@keyframes imageFilter {
  to {
    filter: invert(100%);
  }
}
.right {
  display: flex;
  align-items: center;
  border-left: 3px dashed #373435;
}

.barcode {
  height: 45px;
  width: 120px;
  transform: rotate(90deg);
  background: repeating-linear-gradient(0.25turn, black 0, black 5px, var(--gray) 5px, var(--gray) 6px, black 6px, black 8px, var(--gray) 8px, var(--gray) 10px, black 10px, black 20px, var(--gray) 20px, var(--gray) 25px, black 25px, black 26px);
}
</style>