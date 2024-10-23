import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 800
    height: 600
    title: "Graph Plotting"

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Рисуем оси
            ctx.strokeStyle = "black";
            ctx.lineWidth = 1;

            // Ось X
            ctx.beginPath();
            ctx.moveTo(0, height / 2);
            ctx.lineTo(width, height / 2);
            ctx.stroke();

            // Ось Y
            ctx.beginPath();
            ctx.moveTo(width / 2, 0);
            ctx.lineTo(width / 2, height);
            ctx.stroke();

            // Добавляем значения на оси X
            ctx.fillStyle = "black";
            ctx.textAlign = "center";
            ctx.textBaseline = "top";
            for (var i = 0; i <= width; i += 50) {
                ctx.fillText((i - width / 2) / 50, i, height / 2 + 5);
            }

            // Добавляем значения на оси Y
            ctx.textAlign = "right";
            ctx.textBaseline = "middle";
            for (var j = 0; j <= height; j += 50) {
                ctx.fillText((height / 2 - j) / 50, width / 2 - 5, j);
            }

            // Рисуем синусоиду
            ctx.strokeStyle = "blue";
            ctx.lineWidth = 2;

            ctx.beginPath();
            for (var x = 0; x < width; x++) {
                var y = height / 2 - Math.sin((x - width / 2) / 50) * 100; // Пример функции: синусоида
                if (x === 0) {
                    ctx.moveTo(x, y);
                } else {
                    ctx.lineTo(x, y);
                }
            }
            ctx.stroke();
        }
    }
}

