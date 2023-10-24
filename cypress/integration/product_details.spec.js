describe("Navigation", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("From homepage to product detail page", () => {
    cy.get("article img").first().click();
    cy.get(".product-detail").should("be.visible");
  });
});
