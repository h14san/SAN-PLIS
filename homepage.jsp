<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Record Expense - SAN-XT</title>
  <style>
    html, body {
      margin: 0;
      padding: 0;
      height: 100%;
      overflow: hidden;
      font-family: 'Poppins', sans-serif;
      background-color: #000;
      color: #fff;
    }

    #particles-js {
      position: absolute;
      width: 100%;
      height: 100%;
      background-color: #000;
      z-index: 0;
    }

    nav {
      position: relative;
      z-index: 2;
      width: 100%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 50px;
      background-color: rgba(0, 0, 0, 0.8);
      font-size: 16px;
      box-shadow: 0 2px 10px rgba(255, 255, 255, 0.1);
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 30px;
      margin: 0;
      padding: 0;
    }

    nav ul li a {
      text-decoration: none;
      color: #ccc;
      transition: color 0.3s;
    }

    nav ul li a:hover {
      color: #fff;
    }

    nav .login a {
      color: #00f5c6;
      text-decoration: none;
      font-weight: bold;
    }

    .container {
      position: relative;
      z-index: 2;
      background: rgba(28, 28, 28, 0.95);
      padding: 30px 40px;
      border-radius: 20px;
      border: 1px solid #ccc;
      box-shadow: 0 0 15px #7e7e7e;
      width: 90%;
      max-width: 500px;
      margin: 100px auto;
    }

    .container h2 {
      text-align: center;
      font-size: 32px;
      margin-bottom: 30px;
      color: #00f5c6;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    input[type="date"],
    input[type="text"],
    input[type="number"] {
      background: #000;
      color: #ccc;
      border: none;
      border-radius: 20px;
      padding: 15px 20px;
      margin-bottom: 20px;
      font-size: 16px;
    }

    input:focus {
      outline: none;
      border-inline: 2px solid #F24E1E;
    }

    button {
      background: linear-gradient(90deg, #e67d5d, #F24E1E);
      color: #000;
      font-weight: bold;
      padding: 15px;
      border: none;
      border-radius: 20px;
      font-size: 18px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    button:hover {
      transform: scale(1.03);
      box-shadow: 0 0 10px #F24E1E;
    }
  </style>
</head>

<body>

<!-- Particle background -->
<div id="particles-js"></div>

<div class="container">
  <h2>Record Your Expense</h2>
  <form action="saveExpense" method="post">
    <input type="date" name="exdate" required="">
    <input type="text" name="description" placeholder="Description" required="">
    <input type="number" name="amount" placeholder="Amount (RWF)" step="100" required="">
    <button type="submit">Save Expense</button>
  </form>
</div>

<!-- Include particles.js library -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<!-- Configure particles -->
<script>
  particlesJS('particles-js', {
    "particles": {
      "number": {
        "value": 80,
        "density": {
          "enable": true,
          "value_area": 800
        }
      },
      "color": {
        "value": "#ffffff"
      },
      "shape": {
        "type": "circle",
        "stroke": {
          "width": 0,
          "color": "#000000"
        }
      },
      "opacity": {
        "value": 0.5,
        "random": false
      },
      "size": {
        "value": 3,
        "random": true
      },
      "line_linked": {
        "enable": true,
        "distance": 150,
        "color": "#ffffff",
        "opacity": 0.4,
        "width": 1
      },
      "move": {
        "enable": true,
        "speed": 3,
        "direction": "none",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "attract": {
          "enable": false
        }
      }
    },
    "interactivity": {
      "events": {
        "onhover": {
          "enable": true,
          "mode": "repulse"
        },
        "onclick": {
          "enable": true,
          "mode": "push"
        }
      }
    },
    "retina_detect": true
  });
</script>

</body>
</html>
