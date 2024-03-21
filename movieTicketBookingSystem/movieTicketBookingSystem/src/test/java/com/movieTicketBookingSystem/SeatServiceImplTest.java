package com.movieTicketBookingSystem;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.movieTicketBookingSystem.model.BookingHistory;
import com.movieTicketBookingSystem.model.Customer;
import com.movieTicketBookingSystem.model.Seat;
import com.movieTicketBookingSystem.repository.CustomerRepository;
import com.movieTicketBookingSystem.repository.SeatRepository;
import com.movieTicketBookingSystem.service.MovieService;
import com.movieTicketBookingSystem.service.SeatServiceImpl;
import com.movieTicketBookingSystem.service.TheaterScreeningService;

public class SeatServiceImplTest {

    @Mock
    private SeatRepository seatRepository;

    @Mock
    private CustomerRepository customerRepository;

    @Mock
    private TheaterScreeningService theaterScreeningService;

    @Mock
    private MovieService movieService;

    @InjectMocks
    private SeatServiceImpl seatService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testBookSeat() {
        Seat seat = new Seat();
        seat.setScreenIdBooked(1);
        seat.setSeatsBooked(5);

        Seat savedSeat = new Seat();
        savedSeat.setSeatId(1);
        savedSeat.setScreenIdBooked(seat.getScreenIdBooked());
        savedSeat.setSeatsBooked(seat.getSeatsBooked());

        when(seatRepository.save(seat)).thenReturn(savedSeat);

        Seat result = seatService.bookSeat(seat);

        assertNotNull(result);
        assertEquals(savedSeat.getSeatId(), result.getSeatId());
        assertEquals(savedSeat.getScreenIdBooked(), result.getScreenIdBooked());
        assertEquals(savedSeat.getSeatsBooked(), result.getSeatsBooked());
    }

    @Test
    public void testGetAllBookedSeatDetail() {
        List<Seat> expectedSeatList = new ArrayList<>();
        expectedSeatList.add(new Seat());
        expectedSeatList.add(new Seat());

        when(seatRepository.findAll()).thenReturn(expectedSeatList);

        List<Seat> result = seatService.getAllBookedSeatDetail();

        assertNotNull(result);
        assertEquals(expectedSeatList.size(), result.size());
        assertEquals(expectedSeatList, result);
    }

    @Test
    public void testGetSeat_ExistingSeatWithCustomer() {
        int seatId = 1;
        int customerId = 1;
        Seat seat = new Seat();
        seat.setSeatId(seatId);
        seat.setCustomerIdBooked(customerId);

        Optional<Seat> seatOptional = Optional.of(seat);
        when(seatRepository.findById(seatId)).thenReturn(seatOptional);

        Customer expectedCustomer = new Customer();
        expectedCustomer.setCustomerId(customerId);
        Optional<Customer> customerOptional = Optional.of(expectedCustomer);
        when(customerRepository.findById(customerId)).thenReturn(customerOptional);

        Optional<Customer> result = seatService.getSeat(seatId);

        assertNotNull(result);
        assertTrue(result.isPresent());
        assertEquals(expectedCustomer, result.get());
    }

    
    @Test
    public void testGetBookingHistory_NoBookedSeats() {
        int customerId = 1;

        List<Seat> bookedList = new ArrayList<>();

        when(seatRepository.findByCustomerIdBooked(customerId)).thenReturn(bookedList);

        List<BookingHistory> result = seatService.getBookingHistory(customerId);

        assertNull(result);
    }

    @Test
    public void testCancelSeat_ExistingSeat() {
        int seatId = 1;
        int screenId = 1;
        int seatsBooked = 2;

        Seat seat = new Seat();
        seat.setScreenIdBooked(screenId);
        seat.setSeatsBooked(seatsBooked);

        Optional<Seat> seatOptional = Optional.of(seat);
        when(seatRepository.findById(seatId)).thenReturn(seatOptional);

        seatService.cancelSeat(seatId);

        verify(theaterScreeningService).setCancelSeatNumbers(screenId, seatsBooked);
        verify(seatRepository).deleteById(seatId);
    }

    @Test
    public void testCancelSeat_NonExistingSeat() {
        int seatId = 1;

        Optional<Seat> seatOptional = Optional.empty();
        when(seatRepository.findById(seatId)).thenReturn(seatOptional);

        seatService.cancelSeat(seatId);

        verify(theaterScreeningService, never()).setCancelSeatNumbers(anyInt(), anyInt());
        verify(seatRepository, never()).deleteById(anyInt());
    }
}
