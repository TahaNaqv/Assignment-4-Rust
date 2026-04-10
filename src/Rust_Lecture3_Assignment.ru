// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260329
//
// **************************************************************************************************
// Exercise 1: The Wallet Struct  [Beginner] 
// **************************************************************************************************
// Part A — Define the struct
//
// struct Wallet {
//     address: String,   
//     label: String,     
//     lamports: u64,     
//     is_frozen: bool,   
// }
// // fn main() {
// //     // Create a wallet instance
// //     let mut wallet1 = Wallet {
// //         address: String::from("7Yk9...ABC123"),
// //         label: String::from("My Hot Wallet"),
// //         lamports: 2_500_000_000, // 2.5 SOL
// //         is_frozen: false,
// //     };

// //     // Print wallet details
// //     println!("Address: {}", wallet1.address);
// //     println!("Label: {}", wallet1.label);
// //     println!("Balance (lamports): {}", wallet1.lamports);
// //     println!("Frozen: {}", wallet1.is_frozen);

// //     // Modify wallet (since it's mutable)
// //     wallet1.lamports += 500_000_000; // add 0.5 SOL
// //     wallet1.is_frozen = true;

// //     println!("\nAfter update:");
// //     println!("Balance (lamports): {}", wallet1.lamports);
// //     println!("Frozen: {}", wallet1.is_frozen);
// // }
//============================================================================================================
// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260329
//
// Exercise 1: The Wallet Struct  [Beginner] 
// Part B — Implement methods
//
// const LAMPORTS_PER_SOL: u64 = 1_000_000_000;

// struct Wallet {
//     address: String,
//     label: String,
//     lamports: u64,
//     is_frozen: bool,
// }

// impl Wallet {
//     //  Constructor
//     fn new(address: String, label: String) -> Self {
//         Self {
//             address,
//             label,
//             lamports: 0,
//             is_frozen: false,
//         }
//     }

//     //  Deposit
//     fn deposit(&mut self, amount: u64) {
//         if self.is_frozen {
//             println!(" Deposit blocked (wallet frozen)");
//             return;
//         }
//         self.lamports += amount;
//         println!(" Deposited {} lamports", amount);
//     }

//     //  Withdraw
//     fn withdraw(&mut self, amount: u64) -> bool {
//         if self.is_frozen {
//             println!(" Withdraw blocked (wallet frozen)");
//             return false;
//         }

//         if self.lamports < amount {
//             println!(" Withdraw failed (insufficient balance)");
//             return false;
//         }

//         self.lamports -= amount;
//         println!(" Withdrawn {} lamports", amount);
//         true
//     }

//     //  Convert to SOL
//     fn balance_in_sol(&self) -> f64 {
//         self.lamports as f64 / LAMPORTS_PER_SOL as f64
//     }

//     //  Freeze
//     fn freeze(&mut self) {
//         self.is_frozen = true;
//         println!(" Wallet is now frozen");
//     }

//     //  Summary
//     fn summary(&self) {
//         let short_addr: String = self.address.chars().take(8).collect();
//         println!(
//             "{} | {}... | {:.4} SOL | Frozen: {}",
//             self.label,
//             short_addr,
//             self.balance_in_sol(),
//             self.is_frozen
//         );
//     }
// }

// fn main() {
//     println!("===  Create Wallets ===");

//     let mut alice = Wallet::new(
//         String::from("AlicePublicKey123456789"),
//         String::from("Alice Wallet"),
//     );

//     let mut bob = Wallet::new(
//         String::from("BobPublicKey987654321"),
//         String::from("Bob Wallet"),
//     );

//     alice.summary();
//     bob.summary();

//     // ------------------------------------

//     println!("\n===  Deposits ===");

//     alice.deposit(3 * LAMPORTS_PER_SOL); // 3 SOL
//     bob.deposit(1 * LAMPORTS_PER_SOL);   // 1 SOL

//     alice.summary();
//     bob.summary();

//     // ------------------------------------

//     println!("\n===  Transfer 1: Alice → Bob (1.5 SOL) ===");

//     let amount = 1_500_000_000;

//     if alice.withdraw(amount) {
//         bob.deposit(amount);
//         println!(" Transfer 1 successful");
//     } else {
//         println!(" Transfer 1 failed");
//     }

//     alice.summary();
//     bob.summary();

//     // ------------------------------------

//     println!("\n===  Transfer 2: Bob → Alice (0.3 SOL) ===");

//     let amount = 300_000_000;

//     if bob.withdraw(amount) {
//         alice.deposit(amount);
//         println!(" Transfer 2 successful");
//     } else {
//         println!(" Transfer 2 failed");
//     }

//     alice.summary();
//     bob.summary();

//     // ------------------------------------

//     println!("\n===  Invalid Withdraw (Bob tries 5 SOL) ===");

//     let success = bob.withdraw(5 * LAMPORTS_PER_SOL);
//     println!("Result: {}", success);

//     bob.summary();

//     // ------------------------------------

//     println!("\n===  Freeze Alice ===");

//     alice.freeze();
//     alice.summary();

//     // ------------------------------------

//     println!("\n===  Try actions on frozen wallet ===");

//     alice.deposit(1 * LAMPORTS_PER_SOL);
//     let success = alice.withdraw(500_000_000);
//     println!("Withdraw success: {}", success);

//     alice.summary();

//     // ------------------------------------

//     println!("\n===  Final Balances ===");

//     println!("Alice: {:.4} SOL", alice.balance_in_sol());
//     println!("Bob:   {:.4} SOL", bob.balance_in_sol());
// }
// //
// // Wallet::new(...) Constructor
// //
// // Use u64 for money (lamports) → precise
// // Use f64 only for display (SOL)
// // Always check: - frozen state and - sufficient balance 
// //
// // new() → creates wallets
// // deposit() → normal + frozen case
// // withdraw() → success + insufficient + frozen
// // balance_in_sol() → printed explicitly
// // freeze() → locks wallet
// // summary() → formatted output with short address
// //
// // let short_addr: String = self.address.chars().take(8).collect();
// //   It takes the first 8 characters of the wallet’s address and turns them into a new String.
// //   Full address:   "7Yk9XabcDEF12345"
// //   Short address:  "7Yk9Xabc"
// //   self.address = "7Yk9XabcDEF12345"
// //   Converts the String into an iterator of characters
// //   Important: Rust strings are UTF-8, so this is character-safe
// //   Instead of bytes:
// //   ['7', 'Y', 'k', '9', 'X', 'a', 'b', 'c', 'D', 'E', 'F', '1', '2', '3', '4', '5']
// //   .chars().take(8)
// //   Takes only the first 8 characters
// //   Still an iterator, not a String yet
// //   Iterator → ['7', 'Y', 'k', '9', 'X', 'a', 'b', 'c']
// //   .collect()
// //   Converts the iterator into a collection
// //   Because of this: let short_addr: String
// //   Final result: "7Yk9Xabc"
// //
// // Why not just slice like this?  &self.address[0..8]
// //   This is dangerous in Rust because: Strings are UTF-8 encoded, A character might be more than 1 byte, 
// //   You could slice in the middle of a character →  panic
// // Why this approach is correct?   .chars().take(8).collect()
// //   This is safe in Rust because: Character-safe, No runtime panic, Works with Unicode
// // .chars() → safe but slightly slower (Unicode-aware)
// // .bytes() → faster but unsafe for text
// // Rust forces you to respect string encoding → prevents bugs
// //
// // We’ll use your wallet address idea to show the actual memory difference between bytes and chars.
// //   let addr = "A💎B";
// //   "A"  → 0x41        (1 byte)
// //   "💎" → 0xF0 0x9F 0x92 0x8E   (4 bytes)
// //   "B"  → 0x42        (1 byte)
// //   [ 41 | F0 9F 92 8E | 42 ]
// //   Rust correctly understands: -> '💎' is ONE character -> even though it uses 4 bytes internally
// //
// // Why Slicing is Dangerous -> &addr[0..2] -> This might cut inside the emoji bytes: -> [ F0 9F ] (invalid UTF-8) ->Result: runtime panic
// //
// // Safe Way -> addr.chars().take(2).collect::<String>() -> chars() → ['A', '💎', 'B'] -> take(2)   → ['A', '💎'] -> collect() → "A💎"
// //  Always valid - Never breaks UTF-8
// //  View           Output                           Meaning        
// //  `.as_bytes()`  `[65, 240, 159, 146, 142, 66]`   Raw memory     
// //  `.chars()`     `['A', '💎', 'B']`               Human-readable 
// //
// // Deep Insight (Important)
// //  String in Rust = Vec<u8> (bytes)
// //  Rust does NOT store characters directly
// //  Characters are interpreted on demand
// //  That’s why:
// //  .len() → returns bytes count
// //  .chars().count() → returns character count
//============================================================================================================
// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260329
//
// Exercise 1: The Wallet Struct  [Beginner] 
// Part C — Demonstrate it
//
// const LAMPORTS_PER_SOL: u64 = 1_000_000_000;

// struct Wallet {
//     address: String,
//     label: String,
//     lamports: u64,
//     is_frozen: bool,
// }

// impl Wallet {
//     fn new(address: String, label: String) -> Self {
//         Self {
//             address,
//             label,
//             lamports: 0,
//             is_frozen: false,
//         }
//     }

//     fn deposit(&mut self, amount: u64) {
//         if self.is_frozen {
//             println!(" Deposit blocked (wallet frozen)");
//             return;
//         }
//         self.lamports += amount;
//         println!(" Deposited {} lamports", amount);
//     }

//     fn withdraw(&mut self, amount: u64) -> bool {
//         if self.is_frozen {
//             println!(" Withdraw blocked (wallet frozen)");
//             return false;
//         }
//         if self.lamports < amount {
//             println!(" Withdraw failed (insufficient balance)");
//             return false;
//         }
//         self.lamports -= amount;
//         println!(" Withdrawn {} lamports", amount);
//         true
//     }

//     fn balance_in_sol(&self) -> f64 {
//         self.lamports as f64 / LAMPORTS_PER_SOL as f64
//     }

//     fn freeze(&mut self) {
//         self.is_frozen = true;
//         println!(" Wallet is now frozen");
//     }

//     fn summary(&self) {
//         let short_addr: String = self.address.chars().take(8).collect();
//         println!(
//             "{}   {} ...   {:.2} SOL   frozen: {}",
//             self.label,
//             short_addr,
//             self.balance_in_sol(),
//             self.is_frozen
//         );
//     }
// }

// fn main() {
//     // 1️ Create two wallets
//     let mut wallet1 = Wallet::new(
//         String::from("7xKXtg2CWallet1PublicKeyABC123"),
//         String::from("[My Hot Wallet]"),
//     );

//     let mut wallet2 = Wallet::new(
//         String::from("AB4kRmQPWallet2PublicKeyXYZ789"),
//         String::from("[Cold Storage] "),
//     );

//     println!("=== Initial Wallets ===");
//     wallet1.summary();
//     wallet2.summary();

//     // 2️ Deposit funds
//     println!("\n=== Deposits ===");
//     wallet1.deposit(5 * LAMPORTS_PER_SOL);   // 5 SOL
//     wallet2.deposit(1_500_000_000);       // 1.5 SOL

//     wallet1.summary();
//     wallet2.summary();

//     // 3️ Attempt withdrawal from wallet 1
//     println!("\n=== Withdrawal Attempt from Wallet 1 ===");
//     let success = wallet1.withdraw(2 * LAMPORTS_PER_SOL); // 2 SOL
//     println!("Withdrawal success: {}", success);

//     wallet1.summary();

//     // 4️ Freeze wallet 2 and try deposit
//     println!("\n=== Freeze Wallet 2 and Attempt Deposit ===");
//     wallet2.freeze();
//     wallet2.deposit(1 * LAMPORTS_PER_SOL); // should be blocked

//     // 5️ Summary of both wallets
//     println!("\n=== Final Wallet Summaries ===");
//     wallet1.summary();
//     wallet2.summary();
// }
//============================================================================================================
// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260329
//
// **************************************************************************************************
// Exercise 2: Transaction Status System  [Beginner]
// **************************************************************************************************
// Part A — Define the enum
//
/*
Create an enum called TxStatus with exactly these five variants: 
// Your enum must have all five variants: 
enum TxStatus { 
Pending,                              
Simulating,                           
Confirmed { slot: u64, fee: u64 },    
Failed(String),                       
}
*/

// enum TxStatus {
//     Pending,                                // No data — awaiting inclusion
//     Simulating,                             // No data — being simulated
//     Confirmed { slot: u64, fee: u64 },      // Named fields — success
//     Failed(String),                         // Tuple — error message
//     Dropped { reason: String, after_ms: u64 }, // Named fields — timed out
// }
// //============================================================================================================
// // Assignment 04 : Structs, Enums & Pattern Matching
// // Date : 20260329
// //
// // **************************************************************************************************
// // Exercise 2: Transaction Status System  [Beginner]
// // **************************************************************************************************
// // Part B — Implement describe()
// //
// /*
// Add an impl block for TxStatus. Write a method describe(&self) that uses match to print a clear, 
// human-readable message for each variant. The Confirmed arm should print both the slot and the fee in 
// lamports. The Dropped arm should print the reason and how many milliseconds elapsed before it was 
// dropped.  
// */
// impl TxStatus {
//     fn describe(&self) {
//         match self {
//             TxStatus::Pending => {
//                 println!("Transaction is pending and waiting to be included.");
//             }
//             TxStatus::Simulating => {
//                 println!("Transaction is currently being simulated.");
//             }
//             TxStatus::Confirmed { slot, fee } => {
//                 println!(
//                     "Transaction confirmed in slot {} with fee {} lamports.",
//                     slot, fee
//                 );
//             }
//             TxStatus::Failed(error) => {
//                 println!("Transaction failed with error: {}", error);
//             }
//             TxStatus::Dropped { reason, after_ms } => {
//                 println!(
//                     "Transaction dropped after {} ms due to: {}.",
//                     after_ms, reason
//                 );
//             }
//         }
//     }
//         //============================================================================================================
//         // Assignment 04 : Structs, Enums & Pattern Matching
//         // Date : 20260329
//         //
//         // **************************************************************************************************
//         // Exercise 2: Transaction Status System  [Beginner]
//         // **************************************************************************************************
//         // Part C — Implement is_final() 
//         //
//         /*
//         Add a second method, is_final(&self) -> bool, that returns true only for Confirmed and Failed, and false 
//         for everything else. Use match. */
//     fn is_final(&self) -> bool {
//         match self {
//             TxStatus::Confirmed { .. } => true,
//             TxStatus::Failed(_) => true,
//             _ => false,
//         }
//     }
//     /* or this can be writen as 
//     fn is_final(&self) -> bool {
//     match self {
//         TxStatus::Confirmed { slot: _, fee: _ } => true,
//         TxStatus::Failed(_error) => true,
//         TxStatus::Pending => false,
//         TxStatus::Simulating => false,
//         TxStatus::Dropped { reason: _, after_ms: _ } => false,
//     }
//     } */
//     /*
//         1. No { .. }
//         Instead of:

//         TxStatus::Confirmed { .. }
//         We explicitly list fields:

//         TxStatus::Confirmed { slot: _, fee: _ }
//         2. No _ (tuple shortcut style)
//         Instead of:

//         TxStatus::Failed(_)
//         We bind it to a variable (even if unused):

//         TxStatus::Failed(_error)
//         3. Fully Exhaustive Matching (No catch-all _)
//         Instead of:

//         _ => false
//         We explicitly match all remaining variants:

//         TxStatus::Pending => false,
//         TxStatus::Simulating => false,
//         TxStatus::Dropped { reason: _, after_ms: _ } => false,

//         Why This Version is Important
//         This version shows:
//             Full control over pattern matching
//             No shortcuts → better for interviews
//             More readable in strict systems
//             Compiler guarantees 100% exhaustiveness

//         Pro Tip
//         There are 3 levels of pattern matching mastery:

//         Level	                    Style
//         Beginner	                _ => false
//         Intermediate	            { .. }, (_)
//         Advanced (You just did)	    Explicit fields + full match
//      */

// }
// //============================================================================================================
// // Assignment 04 : Structs, Enums & Pattern Matching
// // Date : 20260329
// //
// // **************************************************************************************************
// // Exercise 2: Transaction Status System  [Beginner]
// // **************************************************************************************************
// // Part D — Demonstrate it 
// //
// /*
// Create one instance of every variant and call both describe() and is_final() on each. Your output should 
// show clearly that Pending and Simulating are not final, while Confirmed and Failed are. 
// Reminder: 
// When you add a new variant to an enum later, the compiler will find every match in your code that 
// doesn't handle it — that's exhaustive matching protecting you. 
//  */
// fn main() {
//     let tx1 = TxStatus::Pending;
//     let tx2 = TxStatus::Simulating;
//     let tx3 = TxStatus::Confirmed { slot: 12345, fee: 5000 };
//     let tx4 = TxStatus::Failed(String::from("Insufficient funds"));
//     let tx5 = TxStatus::Dropped {
//         reason: String::from("Timeout"),
//         after_ms: 3000,
//     };

//     let transactions = vec![tx1, tx2, tx3, tx4, tx5];

//     for tx in transactions {
//         tx.describe();
//         println!("Is final? {}\n", tx.is_final());
//     }
// }
// // Learning Points
// // 1. Enum Variants Types
// //      Unit variant → Pending
// //      Tuple variant → Failed(String)
// //      Struct variant → Confirmed { slot, fee }
// //
// // 2. Pattern Matching with Data Extraction
// //      TxStatus::Confirmed { slot, fee }
// //      You directly extract values from the enum.
// //
// // 3. Exhaustive Matching (VERY IMPORTANT)
// //      Rust forces you to handle every variant.
// //      If you later add:
// //          Cancelled
// //      Compiler will fail until all match blocks handle it.
// // 
// // 4. Clean Pattern Usage
// //      Pattern	        Meaning
// //      _	            catch-all
// //      ..	            ignore remaining fields
// //      Failed(err)	    extract tuple data

//============================================================================================================
// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260401
//
// **************************************************************************************************
// Exercise 3: The Solana Account Manager  [Intermediate] 
// **************************************************************************************************
// Part A — Define the AccountType enum
/*
Create an enum called AccountType with the following variants: 
• Wallet(String)  — holds the owner's name 
• Program { name: String, version: String }  — a deployed program 
• Token { mint: String, decimals: u8 }  — a token account 
• System  — the built-in System Program account (no data) 
Add a label(&self) -> String method on AccountType that returns a short readable string for each 
variant, e.g. "Wallet (Alice)", "Program: Token2022 v1.0", "Token (mint: So11...)", "System Program". 
*/
//
// #[derive(Debug)]
// #[allow(dead_code)] // `decimals` on Token is stored but not yet consumed
// enum AccountType {
//     Wallet(String),
//     Program { name: String, version: String },
//     Token { mint: String, decimals: u8 },
//     System,
// }

// impl AccountType {
//     /// Returns a short, human-readable label for the account type.
//     fn label(&self) -> String {
//         match self {
//             AccountType::Wallet(owner) => format!("Wallet ({})", owner),
//             AccountType::Program { name, version } => {
//                 format!("Program: {} v{}", name, version)
//             }
//             AccountType::Token { mint, .. } => {
//                 // Show only the first 8 chars of the mint address for brevity
//                 let short_mint = &mint[..mint.len().min(8)];
//                 format!("Token (mint: {}...)", short_mint)
//             }
//             AccountType::System => String::from("System Program"),
//         }
//     }
// }
// //============================================================================================================
// // Assignment 04 : Structs, Enums & Pattern Matching
// // Date : 20260401
// //
// // **************************************************************************************************
// // Exercise 3: The Solana Account Manager  [Intermediate] 
// // **************************************************************************************************
// // Part B — Define the SolanaAccount struct
// /*
// Create a struct SolanaAccount with these fields: 
// • address: String 
// • lamports: u64 
// • account_type: AccountType 
// • is_executable: bool 
// Add an impl block with: 
// • new(address: String, lamports: u64, account_type: AccountType, is_executable: bool) -> 
// SolanaAccount — constructor 
// • display(&self) — prints address (first 10 chars), lamports in SOL, account type label, and 
// whether it is executable 
// */
// //
// struct SolanaAccount {
//     address: String,
//     lamports: u64,
//     account_type: AccountType,
//     is_executable: bool,
// }

// impl SolanaAccount {
//     /// Constructor for creating a new SolanaAccount.
//     fn new(
//         address: String,
//         lamports: u64,
//         account_type: AccountType,
//         is_executable: bool,
//     ) -> SolanaAccount {
//         SolanaAccount {
//             address,
//             lamports,
//             account_type,
//             is_executable,
//         }
//     }

//     /// Prints a formatted summary of the account.
//     fn display(&self) {
//         // Show only the first 10 characters of the address
//         let short_addr = &self.address[..self.address.len().min(10)];

//         // Convert lamports to SOL (1 SOL = 1_000_000_000 lamports)
//         let sol = self.lamports as f64 / 1_000_000_000.0;

//         println!(
//             "Address: {}...  |  Balance: {:.4} SOL  |  Type: {}  |  Executable: {}",
//             short_addr,
//             sol,
//             self.account_type.label(),
//             self.is_executable
//         );
//     }
// }
// //============================================================================================================
// // Assignment 04 : Structs, Enums & Pattern Matching
// // Date : 20260401
// //
// // **************************************************************************************************
// // Exercise 3: The Solana Account Manager  [Intermediate] 
// // **************************************************************************************************
// // Part C — Write the classify function
// /*
// Write a standalone function called classify(account: &SolanaAccount) -> &'static str that uses match to 
// return a classification string. Use match guards where needed: 
// // Required classification rules: 

// // Rules (in priority order):
// //   System account                         → "native"
// //   is_executable == true                  → "program"
// //   lamports == 0                          → "empty"
// //   lamports < 100_000_000  (< 0.1 SOL)    → "dust"
// //   lamports < 1_000_000_000 (< 1 SOL)     → "small"
// //   lamports >= 10_000_000_000 (≥ 10 SOL)  → "whale"
// //   everything else                        → "funded"

// */
// // 
// fn classify(account: &SolanaAccount) -> &'static str {
//     match account {
//         // System accounts are "native" regardless of balance
//         SolanaAccount {
//             account_type: AccountType::System,
//             ..
//         } => "native",

//         // Executable accounts are programs
//         SolanaAccount {
//             is_executable: true,
//             ..
//         } => "program",

//         // Zero balance — account exists but holds nothing
//         SolanaAccount { lamports: 0, .. } => "empty",

//         // Below 0.1 SOL — just dust
//         SolanaAccount { lamports, .. } if *lamports < 100_000_000 => "dust",

//         // Below 1 SOL
//         SolanaAccount { lamports, .. } if *lamports < 1_000_000_000 => "small",

//         // 10 SOL or more — whale territory
//         SolanaAccount { lamports, .. } if *lamports >= 10_000_000_000 => "whale",

//         // Between 1 SOL and 10 SOL
//         _ => "funded",
//     }
// }
// //============================================================================================================
// // Assignment 04 : Structs, Enums & Pattern Matching
// // Date : 20260401
// //
// // **************************************************************************************************
// // Exercise 3: The Solana Account Manager  [Intermediate] 
// // **************************************************************************************************
// // Part D — Demonstrate it 
// //
// /*
// Create an array of at least 5 SolanaAccount instances covering different account types and balance 
// levels. Loop through the array, call display() and classify() on each, and print a neat summary line. 
// Make sure you cover at least one of every AccountType variant. 
// */

// fn main() {
//     println!("╔══════════════════════════════════════════════════════════════╗");
//     println!("║              Solana Account Manager — Demo                  ║");
//     println!("╚══════════════════════════════════════════════════════════════╝");
//     println!();

//     // Build an array of 6 accounts covering every AccountType
//     // and a range of balance levels.
//     let accounts = [
//         // 1. System Program — native, no lamports needed
//         SolanaAccount::new(
//             String::from("11111111111111111111111111111111"),
//             1_000_000_000,
//             AccountType::System,
//             false,
//         ),
//         // 2. Wallet (Alice) — whale (≥ 10 SOL)
//         SolanaAccount::new(
//             String::from("AliceXXXXXXXXXXXXXXXXXXXXXXXXXXXX"),
//             50_000_000_000, // 50 SOL
//             AccountType::Wallet(String::from("Alice")),
//             false,
//         ),
//         // 3. Wallet (Bob) — dust (< 0.1 SOL)
//         SolanaAccount::new(
//             String::from("BobYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"),
//             5_000_000, // 0.005 SOL
//             AccountType::Wallet(String::from("Bob")),
//             false,
//         ),
//         // 4. Program (Token2022) — executable → "program"
//         SolanaAccount::new(
//             String::from("TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss624"),
//             2_500_000_000, // 2.5 SOL
//             AccountType::Program {
//                 name: String::from("Token2022"),
//                 version: String::from("1.0"),
//             },
//             true,
//         ),
//         // 5. Token account (SOL wrapped mint) — small (< 1 SOL)
//         SolanaAccount::new(
//             String::from("So11111111111111111111111111111111"),
//             500_000_000, // 0.5 SOL
//             AccountType::Token {
//                 mint: String::from("So11111111111111111111111111111111"),
//                 decimals: 9,
//             },
//             false,
//         ),
//         // 6. Empty wallet — no lamports
//         SolanaAccount::new(
//             String::from("EmptyZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ"),
//             0,
//             AccountType::Wallet(String::from("Ghost")),
//             false,
//         ),
//     ];

//     // ── Print summary for every account ──────────────────────
//     for (i, account) in accounts.iter().enumerate() {
//         println!("Account #{}", i + 1);
//         account.display();

//         // if let: extract the owner name when it's a Wallet variant
//         if let AccountType::Wallet(ref owner) = account.account_type {
//             println!("  ↳ Wallet owner: {}", owner);
//         }

//         println!("  ↳ Classification: [{}]", classify(account));
//         println!();
//     }

//     // ── Aggregated counts using classify ─────────────────────
//     println!("─────────────────────────────────────────────────────────────");
//     println!("Classification summary:");
//     let categories = ["native", "program", "empty", "dust", "small", "funded", "whale"];
//     for cat in &categories {
//         let count = accounts.iter().filter(|a| classify(a) == *cat).count();
//         if count > 0 {
//             println!("  {:>7}  →  {} account(s)", cat, count);
//         }
//     }
//     println!("─────────────────────────────────────────────────────────────");
// }

//============================================================================================================
// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260401
//
// **************************************************************************************************
// Exercise 4: Option<T> — Safe Lookups  [Intermediate] 
// Concepts: 
//  Option<T>, Some and None, match on Option, if let, while let, unwrap_or, map, Option fields in 
//  structs 
// Rust's Option<T> replaces null. This exercise ensures you can work with it confidently in all the 
// patterns you will encounter in Solana programs. 
// **************************************************************************************************
// Part  A — Struct with an optional field  
//
/*
Define a struct ValidatorNode with these fields: 
• name: String 
• stake: u64 
• vote_account: Option<String>  — not all validators have a linked vote account 
Add methods: 
• new(name: String, stake: u64) -> ValidatorNode — creates with vote_account: None 
• set_vote_account(&mut self, address: String) — sets vote_account to Some(address) 
• vote_account_or_default(&self) -> String — returns the vote account address if present, or the 
string "not registered" if absent (use unwrap_or or if let) 
• summary(&self) — prints name, stake in SOL, and the vote account (using 
vote_account_or_default) 

*/

// #[derive(Debug)]
// struct ValidatorNode {
//     name: String,
//     stake: u64,                      // stored in lamports (1 SOL = 1_000_000_000 lamports)
//     vote_account: Option<String>,    // not every validator has a linked vote account
// }
 
// impl ValidatorNode {
//     /// Creates a new ValidatorNode without a vote account.
//     /// vote_account is explicitly set to None to make the absent value self-documenting.
//     fn new(name: String, stake: u64) -> ValidatorNode {
//         ValidatorNode {
//             name,
//             stake,
//             vote_account: None,   // validator starts unregistered
//         }
//     }
 
//     /// Links a vote account address to this validator.
//     /// Wraps the address in Some(_) to satisfy the Option<String> field type.
//     fn set_vote_account(&mut self, address: String) {
//         self.vote_account = Some(address);
//     }
 
//     /// Returns the vote account address if present, or a fallback string if absent.
//     ///
//     /// unwrap_or_else lazily clones/produces the default only when needed.
//     /// unwrap_or(&"not registered".to_string()) would also compile but
//     /// always evaluates the fallback expression — unwrap_or_else is preferred.
//     fn vote_account_or_default(&self) -> String {
//         // Option::as_deref converts Option<String> → Option<&str> so we can
//         // call unwrap_or without consuming self.vote_account.
//         self.vote_account
//             .as_deref()
//             .unwrap_or("not registered")
//             .to_string()
//     }
 
//     /// Prints a human-readable summary line for this validator.
//     /// Converts stake from lamports to SOL for display (divide by 1e9).
//     fn summary(&self) {
//         let sol = self.stake as f64 / 1_000_000_000.0;
//         println!(
//             "[{}]  stake: {:.2} SOL  |  vote account: {}",
//             self.name,
//             sol,
//             self.vote_account_or_default()   // delegates the None-check here
//         );
//     }
// }
// // **************************************************************************************************
// // Exercise 4: Option<T> — Safe Lookups  [Intermediate] 
// // Concepts: 
// //  Option<T>, Some and None, match on Option, if let, while let, unwrap_or, map, Option fields in 
// //  structs 
// // Rust's Option<T> replaces null. This exercise ensures you can work with it confidently in all the 
// // patterns you will encounter in Solana programs. 
// // **************************************************************************************************
// // Part  B — A lookup function 
// //
// /*
// Write a function find_validator(nodes: &[ValidatorNode], name: &str) -> Option<&ValidatorNode> that 
// searches the slice and returns Some(&node) for the first matching name, or None if not found. 
// Then write a separate function print_stake(nodes: &[ValidatorNode], name: &str) that: 
// • Calls find_validator 
// • Uses match (not if let) to either print the stake in SOL or print "Validator not found"
// */

// // ============================================================
// //  PART B — Lookup function + match-based print
// // ============================================================
 
// /// Searches a slice of ValidatorNode by name.
// ///
// /// Returns Some(&node) for the first match, or None if not found.
// /// The lifetime 'a ties the returned reference to the input slice —
// /// the borrow checker needs this to ensure the reference stays valid.
// fn find_validator<'a>(nodes: &'a [ValidatorNode], name: &str) -> Option<&'a ValidatorNode> {
//     // Iterator::find returns Option<&T> — exactly what we need.
//     nodes.iter().find(|node| node.name == name)
// }
 
// /// Prints the stake of a named validator, or an error message if absent.
// ///
// /// Uses `match` (not `if let`) as required by the assignment, which makes
// /// exhaustiveness explicit: the compiler forces us to handle both arms.
// fn print_stake(nodes: &[ValidatorNode], name: &str) {
//     match find_validator(nodes, name) {
//         Some(node) => {
//             let sol = node.stake as f64 / 1_000_000_000.0;
//             println!("{} has a stake of {:.2} SOL", node.name, sol);
//         }
//         None => {
//             println!("Validator not found: \"{}\"", name);
//         }
//     }
// }
// // **************************************************************************************************
// // Exercise 4: Option<T> — Safe Lookups  [Intermediate] 
// // Concepts: 
// //  Option<T>, Some and None, match on Option, if let, while let, unwrap_or, map, Option fields in 
// //  structs 
// // Rust's Option<T> replaces null. This exercise ensures you can work with it confidently in all the 
// // patterns you will encounter in Solana programs. 
// // **************************************************************************************************
// // Part  C — while let stack processing  
// //
// /*
// Create a Vec<ValidatorNode> with at least 4 validators. Use a while let loop to pop validators one by 
// one and: 
// • If the popped validator has a vote_account (Some), print its name and vote account address 
// • If the popped validator has no vote_account (None), print its name and "awaiting registration" 
// After the loop, confirm with a println! that the vector is now empty. 
// */
// //
// // ============================================================
// //  PART C — while let stack processing
// // ============================================================
 
// fn process_stack(mut stack: Vec<ValidatorNode>) {
//     println!("\n--- Processing validator stack (LIFO order) ---");
 
//     // `while let` keeps looping as long as pop() returns Some(_).
//     // Vec::pop() returns Option<ValidatorNode> — None when the vec is empty.
//     while let Some(validator) = stack.pop() {
//         // Pattern-match on the inner Option<String> field to choose the message.
//         match &validator.vote_account {
//             Some(addr) => println!(
//                 "  {} → vote account: {}",
//                 validator.name, addr
//             ),
//             None => println!(
//                 "  {} → awaiting registration",
//                 validator.name
//             ),
//         }
//     }
 
//     // After the loop the vec must be empty — confirm it.
//     println!(
//         "\nStack is now empty: {}",
//         stack.is_empty()   // true
//     );
// }
// //==================================================
// // not assignment just iqnore it
// //==================================================
// // ============================================================
// //  main — wires everything together
// // ============================================================
 
// fn main() {
//     // --------------------------------------------------------
//     // Part A demo
//     // --------------------------------------------------------
//     println!("=== Part A: ValidatorNode struct ===\n");
 
//     let mut v1 = ValidatorNode::new("Helius".to_string(), 500_000_000_000);
//     let mut v2 = ValidatorNode::new("Solflare".to_string(), 320_000_000_000);
//     let v3     = ValidatorNode::new("GenesysGo".to_string(), 180_000_000_000);
//     let mut v4 = ValidatorNode::new("Triton".to_string(), 95_000_000_000);
 
//     // Register vote accounts for some validators.
//     v1.set_vote_account("Vote111aaa...XYZ".to_string());
//     v2.set_vote_account("Vote222bbb...ABC".to_string());
//     // v3 intentionally left without a vote account (None).
//     v4.set_vote_account("Vote444ddd...DEF".to_string());
 
//     v1.summary();
//     v2.summary();
//     v3.summary();  // will print "not registered"
//     v4.summary();
 
//     // --------------------------------------------------------
//     // Part B demo
//     // --------------------------------------------------------
//     println!("\n=== Part B: find_validator + print_stake ===\n");
 
//     // Build a slice for lookups.
//     let nodes = vec![
//         ValidatorNode { name: "Helius".to_string(),    stake: 500_000_000_000, vote_account: Some("Vote111aaa...XYZ".to_string()) },
//         ValidatorNode { name: "Solflare".to_string(),  stake: 320_000_000_000, vote_account: Some("Vote222bbb...ABC".to_string()) },
//         ValidatorNode { name: "GenesysGo".to_string(), stake: 180_000_000_000, vote_account: None },
//         ValidatorNode { name: "Triton".to_string(),    stake:  95_000_000_000, vote_account: Some("Vote444ddd...DEF".to_string()) },
//     ];
 
//     print_stake(&nodes, "Solflare");    // found
//     print_stake(&nodes, "GenesysGo");  // found
//     print_stake(&nodes, "Phantom");    // NOT found → "Validator not found"
 
//     // Bonus: show map() usage on the Option returned by find_validator.
//     // Option::map transforms the inner value without unwrapping.
//     let maybe_stake: Option<u64> = find_validator(&nodes, "Helius").map(|v| v.stake);
//     println!("\nmap() demo — Helius raw stake (lamports): {:?}", maybe_stake);
 
//     // --------------------------------------------------------
//     // Part C demo
//     // --------------------------------------------------------
//     println!("\n=== Part C: while let stack processing ===\n");
 
//     // Build a Vec of at least 4 validators.
//     // Note: we move ownership into process_stack, which pops the vec.
//     let stack: Vec<ValidatorNode> = vec![
//         ValidatorNode::new("Validator-Alpha".to_string(), 400_000_000_000),
//         {
//             let mut v = ValidatorNode::new("Validator-Beta".to_string(), 260_000_000_000);
//             v.set_vote_account("VoteBeta...111".to_string());
//             v
//         },
//         ValidatorNode::new("Validator-Gamma".to_string(), 150_000_000_000),
//         {
//             let mut v = ValidatorNode::new("Validator-Delta".to_string(), 88_000_000_000);
//             v.set_vote_account("VoteDelta...999".to_string());
//             v
//         },
//     ];
 
//     process_stack(stack);
//     // `stack` is moved; the vec (now empty) lives inside process_stack's scope.
// }



// Assignment 04 : Structs, Enums & Pattern Matching
// Date : 20260401
//
// **************************************************************************************************
// Exercise 5: Spot the Bug  [Beginner] 
//
// Concepts: 
//  Reading compiler errors, understanding common mistakes, immutability, match exhaustiveness, 
//  mutable vs immutable methods, None vs Some 
// Each code snippet below contains exactly one bug. For each snippet: (a) identify the bug, (b) explain in 
// plain English what the compiler error means and why it occurs, (c) write the corrected version of the 
// snippet. You do NOT need to run these — reason through them. 
// **************************************************************************************************
//
// Bug 1 — Mutability error 
/*

Wrong Code

struct Counter { value: u64 } 
impl Counter { 
fn increment(&mut self) { self.value += 1; } 
} 
fn main() { 
let c = Counter { value: 0 };   // Bug is here 
c.increment(); 
println!("{}", c.value); 
} 
*/

// struct Counter { value: u64 } 
// impl Counter { 
// fn increment(&mut self) { self.value += 1; } 
// } 
// fn main() { 
// let mut c = Counter { value: 0 };   // Bug is here 
// c.increment(); 
// println!("{}", c.value); 
// } 
//
//  Bug 1 — Mutability Error
//  Problem
// let c = Counter { value: 0 };   // immutable
// c.increment(); // needs mutable
//  Explanation
// increment(&mut self) requires a mutable reference
// But c is immutable by default
// Rust prevents modifying immutable data → compile-time error
//  Error meaning:
// “You’re trying to mutate something that was declared immutable”
// **************************************************************************************************
// Exercise 5: Spot the Bug  [Beginner] 
//
// Concepts: 
//  Reading compiler errors, understanding common mistakes, immutability, match exhaustiveness, 
//  mutable vs immutable methods, None vs Some 
// Each code snippet below contains exactly one bug. For each snippet: (a) identify the bug, (b) explain in 
// plain English what the compiler error means and why it occurs, (c) write the corrected version of the 
// snippet. You do NOT need to run these — reason through them. 
// **************************************************************************************************
//
// Bug 2 — Non-exhaustive match
/*

Wrong code

enum Direction { North, South, East, West } 
fn describe(d: Direction) { 
    match d { 
        Direction::North => println!("Going north"), 
        Direction::South => println!("Going south"), 
        Direction::East  => println!("Going east"), 
    // Bug: West is missing 
    } 
}

*/ 
// option 1 Add missing case
// enum Direction { North, South, East, West } 
// fn describe(d: Direction) { 
//     match d { 
//         Direction::North => println!("Going north"), 
//         Direction::South => println!("Going south"), 
//         Direction::East  => println!("Going east"), 
//         Direction::West  => println!("Going west"), 
//     // Bug: West is missing 
//     } 
// }
// option 2  Catch-all
// enum Direction { North, South, East, West } 
// fn describe(d: Direction) { 
//     match d { 
//         Direction::North => println!("Going north"), 
//         Direction::South => println!("Going south"), 
//         Direction::East  => println!("Going east"), 
//                        _ => println!("Other direction"),
//     // Bug: West is missing 
//     } 
// }
//
//  Explanation
// Rust requires exhaustive matching
// All enum variants must be handled
// West is missing → compile error
//  Error meaning:
// “You didn’t handle all possible cases”
// **************************************************************************************************
// Exercise 5: Spot the Bug  [Beginner] 
//
// Concepts: 
//  Reading compiler errors, understanding common mistakes, immutability, match exhaustiveness, 
//  mutable vs immutable methods, None vs Some 
// Each code snippet below contains exactly one bug. For each snippet: (a) identify the bug, (b) explain in 
// plain English what the compiler error means and why it occurs, (c) write the corrected version of the 
// snippet. You do NOT need to run these — reason through them. 
// **************************************************************************************************
//
// Bug 3 — Wrong method receiver
/*
Wrong Code

struct Vault { balance: u64 } 
impl Vault { 
    fn show_balance(&mut self) -> u64 {  // Bug is in this line 
    self.balance 
    } 
} 
Explain: why is &mut self wrong here, and what should it be?
*/
//
// struct Vault { balance: u64 } 
// impl Vault { 
//     fn show_balance(self) -> u64 {  // Bug Removed 
//     self.balance 
//     } 
// } 
//
//  Explanation
// &mut self means this function modifies the struct
// But this function only reads data
// So mutable access is unnecessary and restrictive
//  Why it's wrong:
// You can’t call this method on an immutable instance
// It violates Rust’s immutability safety design
// 
// **************************************************************************************************
// Exercise 5: Spot the Bug  [Beginner] 
//
// Concepts: 
//  Reading compiler errors, understanding common mistakes, immutability, match exhaustiveness, 
//  mutable vs immutable methods, None vs Some 
// Each code snippet below contains exactly one bug. For each snippet: (a) identify the bug, (b) explain in 
// plain English what the compiler error means and why it occurs, (c) write the corrected version of the 
// snippet. You do NOT need to run these — reason through them. 
// **************************************************************************************************
//
// Bug 4 — Calling unwrap() on None
/*

Wrong

fn get_fee(name: &str) -> Option<u64> { 
    if name == "base" { Some(5000) } else { None } 
} 

fn main() { 
    let fee = get_fee("priority").unwrap();  // Bug: will panic 
    println!("Fee: {}", fee); 
} 
Fix it using unwrap_or(0) and explain what would have happened at runtime without the fix. 

*/

// fn get_fee(name: &str) -> Option<u64> { 
//     if name == "base" { Some(5000) } else { None } 
// } 

// fn main() { 
//     let fee = get_fee("priority").unwrap_or(0)  // safe default 
//     println!("Fee: {}", fee); 
// } 

//  Bug 4 — unwrap() on None
//  Problem
// let fee = get_fee("priority").unwrap(); // returns None → panic
//  Explanation
// get_fee("priority") returns None
// .unwrap() on None → runtime panic (crash)
//  What happens at runtime:
// Program crashes with: “called Option::unwrap() on a None value”
//  Insight
// unwrap() → dangerous (can crash)
// unwrap_or(default) → safe fallback
// **************************************************************************************************
// Exercise 5: Spot the Bug  [Beginner] 
//
// Concepts: 
//  Reading compiler errors, understanding common mistakes, immutability, match exhaustiveness, 
//  mutable vs immutable methods, None vs Some 
// Each code snippet below contains exactly one bug. For each snippet: (a) identify the bug, (b) explain in 
// plain English what the compiler error means and why it occurs, (c) write the corrected version of the 
// snippet. You do NOT need to run these — reason through them. 
// **************************************************************************************************
//
// Bug 5 — Forgetting #[derive(Debug)] 

/*

Wrong Code
#[derive(Clone)] 
struct Token { symbol: String, supply: u64 } 
fn main() { 
let t = Token { symbol: String::from("SOL"), supply: 600_000_000 }; 
println!("{:?}", t);  // Bug 
}
*/

//
// #[derive(Clone, Debug)] // FIX: add Debug
// struct Token { symbol: String, supply: u64 } 
// fn main() { 
//     let t = Token { symbol: String::from("SOL"), supply: 600_000_000 }; 
//     println!("{:?}", t);  // Bug Removed
// }

//  Bug 5 — Missing Debug Trait
//  Problem
// println!("{:?}", t); // requires Debug
//  Explanation
// {:?} is for debug printing
// Struct must implement Debug trait
// Only Clone is derived → compile error
//  Error meaning:
// “Token doesn’t implement Debug”

// Final Quick Summary
// Bug	Concept	Fix
// 1	Mutability	Add mut
// 2	Exhaustive match Handle all enum variants
// 3	Method receiver	Use &self instead of &mut self
// 4	Option safety Use unwrap_or()
// 5	TraitsAdd #[derive(Debug)]

