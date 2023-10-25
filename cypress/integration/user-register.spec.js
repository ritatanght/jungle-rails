describe("User register", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("successful user registration will redirect to home page signed in as the new user", () => {
    cy.contains("Sign in").click();
    cy.contains("Sign up").click();
    cy.get("[id$=first_name]").type("Sherry");
    cy.get("[id$=last_name]").type("Howe");
    cy.get("[id$=email]").type("sh@example.com");
    cy.get("[id$=password]").type("1234");
    cy.get("[id$=password_confirmation]").type("1234{enter}");

    cy.get(".products article").should("have.length", 2);
    cy.contains("Signed in as Sherry").should("be.visible");
  });
});
