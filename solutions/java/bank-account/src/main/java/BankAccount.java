class BankAccount {
    private int balance = 0;
    private boolean opened = false;

    void open() throws BankAccountActionInvalidException {
        if (opened) {
            throw new BankAccountActionInvalidException("Account already open");
        }
        balance = 0;
        opened = true;
    }

    synchronized void close() throws BankAccountActionInvalidException {
        if (!opened) {
            throw new BankAccountActionInvalidException("Account not open");
        }
        opened = false;
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        notClosed();
        return balance;
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        notClosed();
        if (amount < 0)
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        balance += amount;
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        notClosed();
        if (amount < 0)
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        if (amount > balance)
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        balance -= amount;
    }

    private void notClosed() throws BankAccountActionInvalidException {
        if (!opened) {
            throw new BankAccountActionInvalidException("Account closed");
        }
    }
}