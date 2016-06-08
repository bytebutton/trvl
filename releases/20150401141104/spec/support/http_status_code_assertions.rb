def expect_http_success
  expect_http_status_code('2..')
end
alias expect_http_2xx expect_http_success
# one-line assertion: it { should_respond_with_2xx }
alias should_respond_with_success expect_http_success
alias should_respond_with_2xx expect_http_success

def expect_http_redirect
  expect_http_status_code('3..')
end
alias expect_http_3xx expect_http_redirect
# one-line assertion: "it { should_respond_with_3xx }"
alias should_redirect expect_http_redirect
alias should_respond_with_3xx expect_http_redirect

def expect_http_status_code(expected_pattern)
  http_status_code_string.should match(/HTTP #{expected_pattern}/), "Unexpected status code: #{http_status_code_string}"
end
# one-line assertion: "it { should_respond_with }"
alias should_respond_with expect_http_status_code


def http_status_code_string
  "HTTP #{response.status}"
end
