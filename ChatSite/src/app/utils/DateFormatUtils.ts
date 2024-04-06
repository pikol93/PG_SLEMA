export function formatDate(dateTimeStr: string): string {
    const currentDate = new Date();
    const messageDate = new Date(`${dateTimeStr}`);

    const diffTimeMs = Math.abs(currentDate.getTime() - messageDate.getTime()); 
    const diffDays = Math.floor(diffTimeMs / (1000 * 60 * 60 * 24));

    if (diffDays === 0) {
        return "Dziś";
    } else if (diffDays <= 7) {
        const daysOfWeek = ["NDZ", "PON", "WT", "ŚR", "CZW", "PT", "SOB"];
        const dayOfWeekIndex = messageDate.getDay();
        return daysOfWeek[dayOfWeekIndex];
    } else {
        const year = messageDate.getFullYear();
        const month = messageDate.getMonth() + 1;
        const day = messageDate.getDate();
        return `${day}.${month}.${year}`;
    }
}


export function formatTime(dateTimeStr: string) : string {
    const dateTime = new Date(`${dateTimeStr}`);
    const hours = ('0' + dateTime.getHours()).slice(-2);
    const minutes = ('0' + dateTime.getMinutes()).slice(-2);
    return `${hours}:${minutes}`;
  }