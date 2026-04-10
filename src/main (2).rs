#[derive(Debug)]
enum Position {
    NoPosition,
    Deposited {
        collateral: u64,
    },
    ActiveLoan {
        collateral: u64, 
        borrowed: u64,
        borrow_timestamp: u64,
    },
    Liquidated {
        seized_collateral: u64,
        liquidation_timestamp: u64,
    },
}
#[derive(Debug)]
struct UserAccount {
    address: String,
    position: Position,
}
impl UserAccount {
    fn new(address: String, position: Position) -> Self {
        Self { address, position }
    }
    fn is_at_risk(&self) -> bool {
        match self.position {
            Position::ActiveLoan {
                collateral: _,
                borrowed: _,
                borrow_timestamp: _,
            } => true,
            _ => false,
        }
    }
    fn summarize(&self) {
        match &self.position {
            Position::NoPosition => {
                println!("User {} has no position.", self.address);
            }

            Position::Deposited { collateral } => {
                println!(
                    "User {} deposited {} tokens and is earning yield.",
                    self.address, collateral
                );
            }

            Position::ActiveLoan {
                collateral,
                borrowed,
                borrow_timestamp,
            } => {
                println!(
                    "User {} has an active loan: collateral={}, borrowed={}, since={}",
                    self.address, collateral, borrowed, borrow_timestamp
                );
            }
            Position::Liquidated {
                seized_collateral,
                liquidation_timestamp,
            } => {
                println!(
                    "User {} was liquidated: seized={}, at={}",
                    self.address, seized_collateral, liquidation_timestamp
                );
            }
        }
    }
}
fn main() {
    let user1 = UserAccount::new(
        String::from("Alice"),
        Position::NoPosition,
    );
    let user2 = UserAccount::new(
        String::from("Bob"),
        Position::Deposited { collateral: 1_000 },
    );
    let user3 = UserAccount::new(
        String::from("Charlie"),
        Position::ActiveLoan {
            collateral: 2_000,
            borrowed: 500,
            borrow_timestamp: 1_712_345_678, //1712999999 → Thu, 11 Apr 2024 04:13:19 UTC
        },
    );
    let user4 = UserAccount::new(
        String::from("Dave"),
        Position::Liquidated {
            seized_collateral: 1_500,
            liquidation_timestamp: 1_712_999_999, // 1712999999 → Thu, 11 Apr 2024 04:13:19 UTC
        },
    );
    let users = vec![user1, user2, user3, user4];
    for user in users {
        user.summarize();
        if user.is_at_risk() {
            println!("⚠️  This position is at risk!");
        }
        println!("----------------------------------");
    }
}