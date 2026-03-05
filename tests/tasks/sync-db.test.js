const { syncDB } = require("../../tasks/sync-db")

describe('Testing syncDB', () => {
    test('should execute process 2 times', () => { 
    
        syncDB()
        const times = syncDB()
    
        expect(times).toBe(2);
    });
});