gg.alert("🚗 Car Parking Cheat Script Update 🚗\n\nАвтор: Doni999\nВерсия: 2.0")

-- Эпичная анимация загрузки
function loadingAnimation()
    local text = {"■□□□□", "■■□□□", "■■■□□", "■■■■□", "■■■■■"}
    for i = 1, #text do
        gg.sleep(300)
        gg.toast("Загрузка... " .. text[i])
    end
end

-- Главное меню
function mainMenu()
    loadingAnimation() -- Анимация загрузки при открытии меню
    menu = gg.choice({
        "💰 Бесконечные деньги",
        "🚗 Разблокировка всех машин",
        "⏩ Ускорение/замедление времени",
        "📍 Телепортация по карте",
        "🎯 Взлом на уровень/опыт",
        "🚀 Чит тачка (HP 5948 / Torque 5937)",
        "❌ Выйти"
    }, nil, "🔥 Добро пожаловать в Car Parking Cheat Script 🔥\nВыбери нужную функцию:")

    if menu == 1 then infiniteMoney() end
    if menu == 2 then unlockAllCars() end
    if menu == 3 then timeControl() end
    if menu == 4 then teleport() end
    if menu == 5 then expHack() end
    if menu == 6 then cheatCar() end
    if menu == 7 then os.exit() end
end

-- 💰 Бесконечные деньги
function infiniteMoney()
    loadingAnimation()
    gg.clearResults()
    gg.searchNumber("1000;2000;3000", gg.TYPE_DWORD)
    gg.getResults(50)
    gg.editAll("99999999", gg.TYPE_DWORD)
    gg.toast("✅ Бесконечные деньги активированы!")
end

-- 🚗 Разблокировка всех машин
function unlockAllCars()
    loadingAnimation()
    gg.clearResults()
    gg.searchNumber("0;1;0;1;0;1", gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll("1", gg.TYPE_DWORD)
    gg.toast("✅ Все машины разблокированы!")
end

-- ⏩ Ускорение/замедление времени
function timeControl()
    loadingAnimation()
    local speed = gg.prompt({"Введите желаемую скорость (1 = стандартная):"}, {5}, {"number"})
    if speed then
        gg.setSpeed(speed[1])
        gg.toast("✅ Скорость установлена на " .. speed[1])
    end
end

-- 📍 Телепортация по карте
function teleport()
    loadingAnimation()
    local coords = gg.prompt({"Введите координаты (X, Y, Z):"}, {"0", "0", "0"}, {"number", "number", "number"})
    if coords then
        gg.clearResults()
        gg.searchNumber("0;0;0", gg.TYPE_FLOAT)
        gg.getResults(30)
        gg.editAll(coords[1] .. ";" .. coords[2] .. ";" .. coords[3], gg.TYPE_FLOAT)
        gg.toast("✅ Телепортация выполнена!")
    end
end

-- 🎯 Взлом на уровень/опыт
function expHack()
    loadingAnimation()
    local exp = gg.prompt({"Введите желаемое количество опыта:"}, {99999}, {"number"})
    if exp then
        gg.clearResults()
        gg.searchNumber("100;200;300", gg.TYPE_DWORD)
        gg.getResults(50)
        gg.editAll(exp[1], gg.TYPE_DWORD)
        gg.toast("✅ Уровень повышен до " .. exp[1])
    end
end

-- 🚀 Чит тачка (HP 5948 / Torque 5937)
function cheatCar()
    loadingAnimation()
    gg.clearResults()
    gg.searchNumber("10000", gg.TYPE_DWORD) -- Поиск цены двигателя
    gg.getResults(10)
    gg.refineNumber("10000", gg.TYPE_DWORD) -- Уточнение поиска

    local results = gg.getResults(10)
    if #results == 0 then
        gg.toast("❌ Мотор за 10.000 не найден. Купи его в магазине и попробуй снова.")
        return
    end

    gg.clearResults()
    gg.searchNumber("1466", gg.TYPE_FLOAT) -- Поиск стандартного HP
    gg.getResults(5)
    gg.editAll("5948", gg.TYPE_FLOAT)

    gg.searchNumber("1690", gg.TYPE_FLOAT) -- Поиск стандартного Torque
    gg.getResults(5)
    gg.editAll("5937", gg.TYPE_FLOAT)

    gg.toast("✅ Чит тачка активирована: HP 5948 / Torque 5937!")
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        mainMenu()
    end
end
