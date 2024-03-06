const getFormattedTime = (timeArr) => {
    return timeArr.map((el) =>
        el.split(":")[1] !== "00" ? el.substr(0, 5) : el.substr(0, 2)
    );
};

const getUpdatedWorkingHours = (data, todayOnly) => {
    const closed = "Closed";
    const byAppointment = "By appointment";

    if (data.by_appointment) {
        data.formatted = byAppointment;
        return data;
    }

    data.exceptional = Boolean(data.start_date && data.end_date);

    const today = new Date();

    let endDate = new Date(data.end_date);
    endDate = new Date(endDate.setDate(endDate.getDate() + 1));

    if (
        todayOnly &&
        ((data.exceptional &&
            (today < new Date(data.start_date) || today >= endDate)) ||
            (data.week_day !== null && data.week_day !== today.getDay()))
    ) {
        return null;
    }

    if (!data.start_time || !data.end_time) {
        data.formatted = closed;
    } else {
        const formattedTime = getFormattedTime([
            data.start_time,
            data.end_time,
        ]);
        data.formatted = `${formattedTime[0]} - ${formattedTime[1]}`;
    }

    return data;
};

const getFormattedWorkingHours = (workingHours, todayOnly = false) => {
    if (!workingHours) {
        return [];
    }

    workingHours = workingHours
        .map((el) => getUpdatedWorkingHours(el, todayOnly))
        .filter((el) => !!el);

    if (todayOnly && workingHours.some((el) => el.exceptional)) {
        return workingHours.filter((el) => el.exceptional);
    }

    return workingHours;
};

export { getFormattedWorkingHours };
