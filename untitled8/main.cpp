#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QVector>
#include <QPointF>

class TrajectoryProvider : public QObject {
    Q_OBJECT
    Q_PROPERTY(QVariantList trajectory READ trajectory NOTIFY trajectoryChanged)

public:
    TrajectoryProvider(QObject *parent = nullptr) : QObject(parent) {
        // Пример траектории
        m_trajectory << QPointF(0, 300) << QPointF(100, 250) << QPointF(200, 200) << QPointF(300, 250) << QPointF(400, 300);
    }

    QVariantList trajectory() const {
        QVariantList list;
        for (const QPointF &point : m_trajectory) {
            list.append(QVariant::fromValue(point));
        }
        return list;
    }

signals:
    void trajectoryChanged();

private:
    QVector<QPointF> m_trajectory;
};

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    TrajectoryProvider trajectoryProvider;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("trajectoryProvider", &trajectoryProvider);
    engine.load(QUrl::fromLocalFile("C:/Users/VladimirS/Documents/untitled8/Main.qml"));

    return app.exec();
}

#include "main.moc"

