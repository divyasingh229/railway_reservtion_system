// backend/db.js

function initDatabase() {

    if (!localStorage.getItem("railwayBookings")) {

        const sampleBookings = [

            {
                pnr: 1001,
                passenger: "Rahul Sharma",
                train: "Vande Bharat",
                age: 25,
                status: "Confirmed",
                fare: 1200
            },

            {
                pnr: 1002,
                passenger: "Priya Singh",
                train: "Shatabdi Express",
                age: 30,
                status: "Confirmed",
                fare: 850
            },

            {
                pnr: 1003,
                passenger: "Karan Patel",
                train: "Mysore Express",
                age: 28,
                status: "Confirmed",
                fare: 950
            }

        ];

        localStorage.setItem(
            "railwayBookings",
            JSON.stringify(sampleBookings)
        );
    }
}

function getBookings() {

    return JSON.parse(
        localStorage.getItem("railwayBookings")
    ) || [];
}

function saveBookings(bookings) {

    localStorage.setItem(
        "railwayBookings",
        JSON.stringify(bookings)
    );
}

function addBooking(passenger, train, age, fare) {

    let bookings = getBookings();

    const pnr =
        Math.floor(100000 + Math.random() * 900000);

    bookings.push({

        pnr: pnr,
        passenger: passenger,
        train: train,
        age: age,
        fare: fare,
        status: "Confirmed"

    });

    saveBookings(bookings);

    return pnr;
}

function cancelTicket(pnr) {

    let bookings = getBookings();

    const booking =
        bookings.find(
            b => b.pnr == pnr
        );

    if (!booking) {

        return {
            success: false,
            msg: "Booking not found"
        };
    }

    booking.status = "Cancelled";

    saveBookings(bookings);

    return {
        success: true
    };
}

function getConfirmedBookings() {

    return getBookings().filter(
        b => b.status === "Confirmed"
    );
}

function getCancelledBookings() {

    return getBookings().filter(
        b => b.status === "Cancelled"
    );
}
