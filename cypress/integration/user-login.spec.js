describe("User login", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("successful login will take the user to the home page", () => {
    cy.contains("Sign in").click();
    cy.get("input[name=email]").type("bb@example.com");
    cy.get("input[name=password]").type("1234{enter}");

    cy.get(".products article").should("have.length", 2);
    cy.contains("Signed in as Berry").should("be.visible");
  });
});
