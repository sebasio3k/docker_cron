
times = 0;

const syncDB = () => {
    times++;
    console.log('• Tick every 5 seconds.\n    Total of ticks ->', times);

    return times;
}

module.exports = {
    syncDB
}