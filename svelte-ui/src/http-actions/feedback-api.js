export async function submitFeedback(feedbackData) {
  try {
      const response = await fetch("http://localhost:3001/feedback", {
        method: "POST",
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(feedbackData),
      });
      if (!response.ok) {
          throw new Error('Failed to submit feedback');
      }
      return await response.json();
  } catch (error) {
      console.error(error);
      throw error;
  }
}
